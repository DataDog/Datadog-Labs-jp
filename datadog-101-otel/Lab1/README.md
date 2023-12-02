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
