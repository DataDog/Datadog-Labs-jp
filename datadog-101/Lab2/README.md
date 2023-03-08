# Lab2 - Tomcat インテグレーション

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

`java_bin_path` を有効化し、以下のようにPATHを追加します。

```
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

1. Infrastructure Listで自分のHostを選択
2. Hostをクリック
3. Appsに`tomcat`と表示されていることを確認し、クリック → View metricsを選択
4. グラフが表示され、メトリクスがプロットされていることを確認


以上でLab2は終了です。
[Lab3](../Lab3)を進めてください。
