# MariaDB

# MariaDBの監視設定
【Document】https://docs.datadoghq.com/ja/integrations/mysql/

補足：MariaDB は MySQL の “互換製品” なので、DatadogのMySQLインテグレーションは MariaDB とも互換性があります

## MariaDBの準備

root ユーザーで MariaDB にアクセスします。
パスワードは bitnami ユーザーのホームディレクトリ直下のファイル $HOME/bitnami_credentialsにあります。
（Wordpressのログインパスワードと同じパスワードを使用します。）

```
$ cd ~
$ cat bitnami_credentials
Welcome to the WordPress packaged by Bitnami

******************************************************************************
The default username and password is 'user' and 'xxxxxxxxxxxxx'.   ##←メモ
******************************************************************************

You can also use this password to access the databases and any other component the stack includes.

Please refer to https://docs.bitnami.com/ for more details.
```


MariaDBにrootユーザでログイン。上記で確認したパスワードを入力

```
$ mysql -u root -p
Enter password: xxxxxx #　← 上記でメモしたパスワードを入力
```

Datadog Agent 用のデータベースユーザーを作成します。
パスワードは各自任意のものを設定してください（例：datadog-pw 等）

```
MariaDB [(none)]>  CREATE USER 'datadog'@'localhost' IDENTIFIED BY 'datadog-pw';　#任意のパスワード
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]>  CREATE USER 'datadog'@'127.0.0.1' IDENTIFIED BY 'datadog-pw'; #任意のパスワード
Query OK, 0 rows affected (0.000 sec)
```

```
MariaDB [(none)]> ALTER USER 'datadog'@'localhost' WITH MAX_USER_CONNECTIONS 5;
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> ALTER USER 'datadog'@'127.0.0.1' WITH MAX_USER_CONNECTIONS 5;
Query OK, 0 rows affected (0.00 sec)
```

```
MariaDB [(none)]> GRANT SELECT ON performance_schema.* TO 'datadog'@'localhost';
MariaDB [(none)]> GRANT SELECT ON performance_schema.* TO 'datadog'@'127.0.0.1';

MariaDB [(none)]> exit;
```

## MariaDB メトリクスの収集
### Datadog Agentの設定

MariaDB メトリクスを収集するには、すでにサンプルファイルがありますので、それをコピーして、編集します。

```
$ cd /etc/datadog-agent/conf.d/mysql.d/
$ sudo cp -p conf.yaml.example conf.yaml
$ sudo vi conf.yaml
```
mysql.d/conf.yaml に次の構成ブロックを追加します。

```
init_config:

instances:
  - host: 127.0.0.1
    user: datadog
    pass: 'datadog-pw'  # 上記で設定したパスワードを入力
    port: "3306" # e.g. 3306
    options:
      replication: false
      galera_cluster: true
      extra_status_metrics: true
      extra_innodb_metrics: true
      extra_performance_metrics: true
      schema_size_metrics: false
      disable_innodb_metrics: false
```

### datadog-agentを再起動
`$ sudo service datadog-agent restart`

### DatadogでのMySQL Integrationの確認
0. 別タブでWordpressを開き、いろいろな画面にアクセスしておく
1. ホストマップにもどり、今回設定したサーバの詳細を確認
	1.  ホストの詳細ペインの「Apps」ヘッダーの下に「MySQL」が追加されていることを確認
	2. 「MySQL」をクリックし、「Metrics」,「 Status Check」タブでデータが取得されていることを確認
		※「Logs」はまだ未収集

## MariaDB ログの収集

```
$ sudo mkdir /opt/bitnami/mariadb/logs/
$ sudo touch mysql.log
$ sudo chmod -R 755 /opt/bitnami/mariadb/logs/
```

my.cnf を編集し、以下の行を追加して、一般ログ、エラーログを有効にします。

```
$ sudo vi /opt/bitnami/mariadb/conf/my.cnf
```

```
[mysqld_safe]
log_error = /opt/bitnami/mariadb/logs/mysqld.log

[mysqld]
general_log = on
general_log_file = /opt/bitnami/mariadb/logs/mysql.log
```
1. MariaDBを再起動します。
`sudo /opt/bitnami/ctlscript.sh restart mariadb`

1. MariaDB のログの収集を開始するために、次の構成ブロックを mysql.d/conf.yaml ファイルに追加します。

```
$ cd /etc/datadog-agent/conf.d/mysql.d/
$ sudo vi conf.yaml
```

```
logs:
  - type: file
    path: "/opt/bitnami/mariadb/logs/mysqld.log"
    source: mysql
    service: "mysql"

  - type: file
    path: "/opt/bitnami/mariadb/logs/mysql.log"
    source: mysql
    service: "mysql"
```
### datadog-agentを再起動

`$ sudo service datadog-agent restart`

### DatadogでのMariaDB ログの確認
1. 左側のメニューから「Logs」をクリック
	1.  左にあるfacetsから「Host」を開き、自分のホストを探してクリック（または、画面上部の検索窓から「host:i-xxxxx」と入力）
	2.  表示内容が絞り込まれて自分のHostから出たログだけが出ていることを確認
	3.  facetsの「Service」に「apache」と「mysql」があることを確認
	4.  「mysql」をクリックし、MariaDBのログが取得されていることを確認


