# APMの設定

### トレーサーのダウンロード
cd /opt/bitnami/tomcat/bin
sudo wget -O dd-java-agent.jar https://dtdg.co/latest-java-tracer

### トレーサーの起動設定
sudo vi setenv.sh

### Tomcatの再起動
cd /opt/bitnami
sudo sh ./ctlscript.sh restart tomcat

