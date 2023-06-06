# SQL・IISインテグレーション

Datadogでは、Integrationと呼ばれる仕組みを使って様々なテクノロジーからメトリクスやログを収集することができます。

ここでは、SQL、IISのメトリクス、およびログを収集します。

ドキュメント：[SQL](https://docs.datadoghq.com/integrations/sqlserver/?tab=host)

ドキュメント：[IIS](https://docs.datadoghq.com/ja/integrations/iis/)

## SQLインテグレーション
Datadog Agentがメトリクスを収集できるようにSQLにログインを作成し、Agentがデータを収集できるように設定を行います。

1.　Windowsサーバ上でWindowsメニューからMicrosoft SQL Server Tools19を選択

2.　SQL Server Management Studioを起動

3.　ログイン画面にて接続先ホスト名にて自身のホスト名に修正しログイン
* ホスト名はLab2で起動したDatadog Agent Manager上で確認可能

　　　　> Status > Hostnames > Hostname

4.　ツールバーのNew Queryから以下を実行しログインを作成（パスワードは任意）
```
CREATE LOGIN datadog WITH PASSWORD = '<PASSWORD>';
CREATE USER datadog FOR LOGIN datadog;
GRANT SELECT on sys.dm_os_performance_counters to datadog;
GRANT VIEW SERVER STATE to datadog;
```
5. 作成したdatadogに権限を付与する
```
GRANT CONNECT ANY DATABASE to datadog; 
```
6. Datadog Agentの設定を実施するため、以下ファイルをコピーして名前をconf.yamlに変更する
```
C:\ProgramData\Datadog\conf.d\sqlserver.d\conf.yaml.example
```
7. conf.yamlの以下項目についてコメントアウトをはずし、それぞれ以下のように設定する
```
init_config:

instances:
  - host: localhost,1433
    username: datadog
    password: "<先ほど設定したPASSWORD>"
    connector: odbc
    driver: SQL Server
```

以上でSQLインテグレーションの設定が完了です。

## SQLログ収集設定
SQLのログを収集できるように設定を行います。
1. Datadog Agent　ManagerのSettingsを開き、以下項目のコメントアウトをはずし以下のように設定する。
```
logs_enabled: true
```
2. 先ほど作成したconfファイル（C:\ProgramData\Datadog\conf.d\sqlserver.d\conf.yaml）の以下項目を設定する。
```
logs:
  - type: file
    encoding: utf-16-le
    path: C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Log\ERRORLOG
    source: sqlserver
    service: 任意（イニシャル-SQL）
```

3. 該当のログファイルをAgentが読みに行けるように以下ディレクトリのプロパティのセキュリティ設定で、ddagentuserに対して読み取り権限を付与する
```
C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Log
```

以上でログ収集設定が完了です。

## SQL関連データ収集確認
Datadog Agent ManagerからRestart Agentを実行し、Agentを再起動します。
少し待つとDatadogのUIにデータが表示されてきます。

1. Infrastructure - Infrastructure List - 自身のホストを確認し、ntp,systemに並びsqlserverのマークがついていることを確認する
2. Dashboard - list - SQLと検索し、SQLのプリセットダッシュボードにデータが表示されていることを確認する
3. Log - 一覧にSQLのログが出力されていることを確認する

## IISインテグレーション
SQL同様に、IISの情報を収集する設定を実施します

1. 以下ファイルをコピーして名前をconf.yamlに変更する
```
C:\ProgramData\Datadog\conf.d\iis.d\conf.yaml.example
```
2. 以下項目を以下のように設定する
```
instances:
    sites:
      include:
      - http://localhost/employe.aspx
```
3. SQLと同じ要領でログ収集の設定を同ファイルに対して以下のように行う

```
logs:
  - type: file
    path: C:\inetpub\logs\LogFiles\W3SVC1\u_ex*
    service: myservice
    source: iis
```

4. 該当のログファイルをAgentが読みに行けるように以下ディレクトリのプロパティのセキュリティ設定で、ddagentuserに対して読み取り権限を付与する
```
C:\inetpub\logs\LogFiles\W3SVC1\
```
以上でIISインテグレーション設定が完了です。

## IIS関連データ収集確認
Datadog Agent ManagerからRestart Agentを実行し、Agentを再起動します。
少し待つとDatadogのUIにデータが表示されてきます。

1. Infrastructure - Infrastructure List - 自身のホストを確認し、ntp,systemに並びIISのマークがついていることを確認する
2. Dashboard - list - IISと検索し、IISのプリセットダッシュボードにデータが表示されていることを確認する
3. Log - 一覧にIISのログが出力されていることを確認する


以上でLab2は終了です。
[Lab3](../Lab3)を進めてください。

