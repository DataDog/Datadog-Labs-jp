# Tomcatメトリクスの送信
Integration的な機能はなし、後ほど出てくるトレーサーでランタイムメトリクスは取れるが、Collector単体では取れるのだろうか、誰か調べて！

# Tomcatログの送信
```
sudo vim /etc/otelcol-contrib/config.yaml
```
[config.yaml](https://raw.githubusercontent.com/dd-shocnt/Datadog-Labs-jp/main/datadog-101-otel/Lab2/config.yaml)の設定を入れてみる。Lab1とのコンフィグ差分を確認してみてください。

# OTEL collectorの再起動
```
sudo systemctl status otelcol-contrib.service
sudo systemctl restart otelcol-contrib.service
sudo systemctl status otelcol-contrib.service
```

# Liferayでの操作
WebアクセスログをDatadogに送信するために、Liferayにアクセスします。

# Datadogで確認
Datadogでログを受信できているか確認
