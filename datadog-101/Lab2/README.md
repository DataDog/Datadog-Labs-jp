# Tomcatインテグレーション

Datadogでは、Integrationと呼ばれる仕組みを使って様々なテクノロジーからメトリクスやログを収集することができます。

ここでは、LiferayのコンポーネントのひとつであるTomcatのメトリクス、およびログを収集します。

ドキュメント：[Tomcat](https://docs.datadoghq.com/ja/integrations/tomcat/?tab=host)

## JMXリモートの有効化
Tomcatのメトリクスを収集するには、Tomcat サーバーで JMX リモートを有効にする必要があります。
```
sudo vi /opt/bitnami/tomcat/bin/setenv.sh
```
`setenv.sh`の末尾に以下を追加します。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1"
```
Tomcatを再起動します。
```
sudo /opt/bitnami/ctlscript.sh restart tomcat
```
Tomcatが起動していることを確認します。
```
sudo /opt/bitnami/ctlscript.sh status
apache already running
elasticsearch already running
mariadb already running
tomcat already running
```

## Datadog Agentの設定

Tomcatインテグレーションは、エージェントベースのインテグレーションです。このインテグレーションを有効にするためには、`/etc/datadog-agent/conf.d`配下で設定を有効にする必要があります。

`tomcat.d/conf.yaml`ファイルを作成します。
```
sudo cp /etc/datadog-agent/conf.d/tomcat.d/conf.yaml.example /etc/datadog-agent/conf.d/tomcat.d/conf.yaml
```
`conf.yaml`ファイルを修正します。
```
sudo vi /etc/datadog-agent/conf.d/tomcat.d/conf.yaml
```
`java_bin_path`を有効化し、以下のようにPATHを追加します。
```
  java_bin_path: /opt/bitnami/java/bin/java
```
`java_bin_path`セクションは以下のようになります。
```
    ## @param java_bin_path - string - optional
    ## `java_bin_path` should be set if the Agent cannot find your java executable.
    #
    java_bin_path: /opt/bitnami/java/bin/java
```
Datadog agentを再起動します。
```
sudo service datadog-agent restart
```

JMXチェックが走っているか確認します。

```
sudo datadog-agent status
```

以下のように表示されていればOKです。

```
========
JMXFetch
========

  Information
  ==================
    runtime_version : 11.0.17
    version : 0.47.2
  Initialized checks
  ==================
    tomcat
      instance_name : tomcat-localhost-8050
      message : <no value>
      metric_count : 132
      service_check_count : 0
      status : OK
```


## Datadog上でメトリクスを確認
**Tomcatメトリクスの情報反映には時間が掛かります**

1. Datadog画面に戻り左の\[Infrastructure\]→\[Infrastructure List\]を選択
2. 自分のホストをクリック
3. Appsセクションに`tomcat`と表示されていることを確認し、クリック → View metricsを選択
4. グラフが表示され、メトリクスがプロットされていることを確認

## ログの送信
### Datadog Agentの設定
ログ機能を有効化するために`datadog.yaml`ファイルの`logs_enabled`セクションを`true`に変更します。
```
sudo vi /etc/datadog-agent/datadog.yaml
```
```
##################################
## Log collection Configuration ##
##################################

## @param logs_enabled - boolean - optional - default: false
## @env DD_LOGS_ENABLED - boolean - optional - default: false
## Enable Datadog Agent log collection by setting logs_enabled to true.
#
logs_enabled: true
```
Tomcatのログの収集を開始するために、`tomcat.d/conf.yaml`ファイルを作成し、収集するログファイルを設定します。
```
sudo vi /etc/datadog-agent/conf.d/tomcat.d/conf.yaml
```
ファイル末尾のLog Section中のlogs:を以下のように設定します。
```
## Log Section
##
## type - required - Type of log input source (tcp / udp / file / windows_event).
## port / path / channel_path - required - Set port if type is tcp or udp.
##                                         Set path if type is file.
##                                         Set channel_path if type is windows_event.
## source  - required - Attribute that defines which integration sent the logs.
## encoding - optional - For file specifies the file encoding. Default is utf-8. Other
##                       possible values are utf-16-le and utf-16-be.
## service - optional - The name of the service that generates the log.
##                      Overrides any `service` defined in the `init_config` section.
## tags - optional - Add tags to the collected logs.
##
## Discover Datadog log collection: https://docs.datadoghq.com/logs/log_collection/
#
logs:
  - type: file
    path: /opt/bitnami/tomcat/logs/*
    source: tomcat
    service: liferay-tomcat
```
Datadog Agentがログファイルを読み込めるよう権限を変更します。
```
sudo chmod -R 755 /opt/bitnami/tomcat/logs/
```
Datadog agentを再起動します。
```
sudo service datadog-agent restart
```
ログが送られているか確認します。
```
sudo datadog-agent status
```
以下のように表示されていればOKです。
```
==========
Logs Agent
==========
    Reliable: Sending compressed logs in HTTPS to agent-http-intake.logs.datadoghq.com on port 443
    BytesSent: 10896
    EncodedBytesSent: 2888
    LogsProcessed: 23
    LogsSent: 23

  tomcat
  ------
    - Type: file
      Path: /opt/bitnami/tomcat/logs/*
      Service: liferay-tomcat
      Source: tomcat
      Status: OK
        22 files tailed out of 22 files matching
      Inputs:
        /opt/bitnami/tomcat/logs/host-manager.2023-04-11.log
        /opt/bitnami/tomcat/logs/catalina.out.firstboot
        /opt/bitnami/tomcat/logs/catalina.2023-04-08.log
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-10.txt
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-08.txt
        /opt/bitnami/tomcat/logs/localhost.2023-04-11.log
        /opt/bitnami/tomcat/logs/localhost.2023-04-06.log-20230409.gz
        /opt/bitnami/tomcat/logs/catalina.2023-04-06.log-20230409.gz
        /opt/bitnami/tomcat/logs/manager.2023-04-06.log
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-12.txt
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-09.txt
        /opt/bitnami/tomcat/logs/localhost.2023-04-06.log
        /opt/bitnami/tomcat/logs/host-manager.2023-04-06.log-20230409.gz
        /opt/bitnami/tomcat/logs/host-manager.2023-04-06.log
        /opt/bitnami/tomcat/logs/catalina.2023-04-06.log
        /opt/bitnami/tomcat/logs/manager.2023-04-11.log
        /opt/bitnami/tomcat/logs/manager.2023-04-06.log-20230409.gz
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-11.txt
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-07.txt
        /opt/bitnami/tomcat/logs/localhost_access_log.2023-04-06.txt
        /opt/bitnami/tomcat/logs/catalina.out
        /opt/bitnami/tomcat/logs/catalina.2023-04-11.log
      Bytes Read: 5490
      Pipeline Latency:
        Average Latency (ms): 0
        24h Average Latency (ms): 0
        Peak Latency (ms): 0
        24h Peak Latency (ms): 0
```

### Liferayでの操作
WebアクセスログをDatadogに送信するために、Liferayにアクセスします。

## Datadog上でログを確認
1. Datadog画面に戻り左の\[Logs\]→\[Search\]を選択
2. 左側のFacets欄のCORE->Hostを開き、下図のように自分のホストのみにチェックをつけてください。

![facets](https://github.com/DataDog/Datadog-Labs-jp/blob/main/datadog-101/images/facets.png)

3. どれか1つログをクリックします。
4. Sourceがtomcatとなっており、ログがJSON形式に構造化されていることを確認します。

以上でLab2は終了です。
[Lab3](../Lab3)を進めてください。
