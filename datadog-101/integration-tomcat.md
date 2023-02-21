# Tomcat インテグレーション

ドキュメント：[Tomcat](https://docs.datadoghq.com/ja/integrations/tomcat/?tab=host)

## JMXリモートの有効化
Tomcatのメトリクスを収集するには、Tomcat サーバーで JMX リモートを有効にする必要があります。


```
sudo vi /opt/bitnami/tomcat/bin/setenv.sh
```

末尾に以下を追加します。

```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1"
```

シンボリックリンクをはる

```
sudo ln -s /opt/bitnami/java/bin/java /bin/java
```


Tomcatの再起動

```
sudo /opt/bitnami/ctlscript.sh restart tomcat
```

## Datadog Agentの設定

Tomcatインテグレーションを有効にします。

```
sudo cp /etc/datadog-agent/conf.d/tomcat.d/conf.yaml.example /etc/datadog-agent/conf.d/tomcat.d/conf.yaml
```

agentの再起動

```
sudo service datadog-agent restart
```

確認

```
sudo datadog-agent status
```


## Datadog上でメトリクスを確認

1. Infrastructure Listで自分のHostを選択
2. Hostをクリック
3. Appsに`tomcat`と表示されていることを確認し、クリック → View metricsを選択
4. グラフが表示され、メトリクスがプロットされていることを確認


