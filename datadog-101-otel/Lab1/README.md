# OTEL collectorの導入
```
sudo apt-get -y install wget
wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/vX.XX.X/otelcol-contrib_X.XX.X_linux_amd64.deb
sudo dpkg -i otelcol-contrib_0.86.0_linux_amd64.deb
```

# OTEL collectorの設定
```
sudo cp /etc/otelcol-contrib/config.yaml /etc/otelcol-contrib/config.yaml.bkup
sudo vim /etc/otelcol-contrib/config.yaml
```
[こちら](https://raw.githubusercontent.com/dd-shocnt/Datadog-Labs-jp/main/datadog-101-otel/Lab1/config.yaml)の設定を入れてみる。

# OTEL collectorの有効化
```
sudo systemctl status otelcol-contrib.service
sudo systemctl restart otelcol-contrib.service
sudo systemctl status otelcol-contrib.service
```

# Datadogで確認
Datadogでホスト情報が取得出来ているか確認
