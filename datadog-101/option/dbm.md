# Database Monitoring（Option）
Datadog データベースモニタリングでは、すべてのデータベースのクエリメトリクスと実行計画を1つの場所で見ることができます。データベースモニタリングでは、コストのかかるクエリや遅いクエリを素早くピンポイントで特定し、正確な実行内容を掘り下げてボトルネックに対処できます。また、クエリとホストメトリクスの相関関係により、リソースの制約がデータベースのパフォーマンスに与える影響を容易に特定し理解できます。
【Document】https://docs.datadoghq.com/ja/database_monitoring/

https://www.datadoghq.com/ja/product/database-monitoring/


## MySQLの設定

クエリのメトリクス、サンプル、および実行計画を収集するには、MySQL パフォーマンススキーマを有効にする必要があります。

```
 $ sudo vi /opt/bitnami/mariadb/conf/my.cnf
```

`performance_schema=on` を追記

```
 [mysqld]
 performance_schema=on # 追加
```

MySQLの再起動

```
 sudo /opt/bitnami/ctlscript.sh restart mariadb
```

## エージェントアクセスができるように設定

Datadog Agent が統計やクエリを収集するためには、データベースへの読み取り専用のアクセスが必要となります。

MariaDBにrootユーザーでログイン。パスワードは $HOME/bitnami\_credentialsにあります。

```
 $ mysql -u root -p
```

```
 GRANT REPLICATION CLIENT ON *.* TO datadog@localhost WITH MAX_USER_CONNECTIONS 5;
 GRANT REPLICATION CLIENT ON *.* TO datadog@127.0.0.1 WITH MAX_USER_CONNECTIONS 5;
 ​
 GRANT PROCESS ON *.* TO datadog@localhost;
 GRANT PROCESS ON *.* TO datadog@127.0.0.1;
 ​
 GRANT SELECT ON performance_schema.* TO datadog@localhost;
 GRANT SELECT ON performance_schema.* TO datadog@127.0.0.1;
```

以下のスキーマの作成します。

```
 CREATE SCHEMA IF NOT EXISTS datadog;
 GRANT EXECUTE ON datadog.* to datadog@localhost;
 GRANT CREATE TEMPORARY TABLES ON datadog.* TO datadog@localhost;
```

Agent が説明プランを収集できるようにするには、`explain_statement` プロシージャを作成します。

```
 DELIMITER $$
 CREATE PROCEDURE datadog.explain_statement(IN query TEXT)
     SQL SECURITY DEFINER
 BEGIN
     SET @explain := CONCAT('EXPLAIN FORMAT=json ', query);
     PREPARE stmt FROM @explain;
     EXECUTE stmt;
     DEALLOCATE PREPARE stmt;
 END $$
 DELIMITER ;
```

説明プランを収集するスキーマに対し以下のプロシージャを作成します。ここでは`bitnami_wordpress` を指定しています。

```
 DELIMITER $$
 CREATE PROCEDURE bitnami_wordpress.explain_statement(IN query TEXT)
     SQL SECURITY DEFINER
 BEGIN
     SET @explain := CONCAT('EXPLAIN FORMAT=json ', query);
     PREPARE stmt FROM @explain;
     EXECUTE stmt;
     DEALLOCATE PREPARE stmt;
 END $$
 DELIMITER ;
 GRANT EXECUTE ON PROCEDURE bitnami_wordpress.explain_statement TO datadog@localhost;
```
```
MariaDB [(none)]> exit;
```

## Datadog エージェントの設定

dbmの設定をtrueにします。
```
$ cd /etc/datadog-agent/conf.d/mysql.d/ 
$ sudo vi conf.yaml
```

```
 # dbm: false
```

↓

```
 dbm: true
```

エージェントの再起動

```
 sudo service datadog-agent restart
```

## Datadog上での確認

[APM]→\[Databases]からDatabase Monitoringページに移動し、

<https://app.datadoghq.com/databases?dbType=MySQL>

上部の \[Query Metrics] と \[Query Samples] タブを切り替え、データが送信されていることを確認します。


