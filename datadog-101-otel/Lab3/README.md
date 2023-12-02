# APMの設定
```
cd /opt/bitnami/tomcat/bin/
wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
sudo vim setenv.sh
```
[sentenv.sh](https://raw.githubusercontent.com/dd-shocnt/Datadog-Labs-jp/main/datadog-101-otel/Lab3/setenv.sh)を入れる。

```
sudo vim /etc/otelcol-contrib/config.yaml
```
[config.yaml](https://raw.githubusercontent.com/dd-shocnt/Datadog-Labs-jp/main/datadog-101-otel/Lab3/config.yaml)を入れる。

# OTEL collectorの再起動
```
sudo systemctl status otelcol-contrib.service
sudo systemctl restart otelcol-contrib.service
sudo systemctl status otelcol-contrib.service
```

# Tomcatの再起動
```
sudo /opt/bitnami/ctlscript.sh status tomcat
sudo /opt/bitnami/ctlscript.sh restart tomcat
sudo /opt/bitnami/ctlscript.sh status tomcat
```

# Liferayでの操作
WebトレースをDatadogに送信するために、Liferayにアクセスします。

# Datadogで確認
Datadogでトレースを受信できているか確認
