# EC2 サーバの構築

# サーバ環境の作成

## Amazon EC2 liferayを起動

- [こちら](https://bitnami.com/stack/liferay/cloud/aws/amis)で最新のLiferay AMIを確認し、起動したいリージョンのAMIをクリック
- 「名前」は自由にインスタンス名を入力
- 「インスタンスタイプ」は**T2 large**を選択
- 「キーペア」は自由に入力
- 「パブリック IP の自動割り当て」を有効化
- 「セキュリティグループ」は、SSH（22）とHTTP(80)、HTTPS(443)のインバウンド通信を許可
- 「高度な詳細」で「ユーザーデータ - optional」に下記を追加

```bash
#!/bin/bash
rm -f /etc/ssh/sshd_not_to_be_run
systemctl enable ssh
systemctl start ssh
```

- 「インスタンスを起動」をクリック

## Amazon EC2 liferayの確認
以下のコマンドを実行し、liferayを構成する各サービスが起動していることを確認します
```
sudo /opt/bitnami/ctlscript.sh status
```
以下のように出力されれば正常にサービスが起動しています。[Lab1](../Lab1)を進めてください。そうでなければ以下ステップを実行してください。
```
sudo /opt/bitnami/ctlscript.sh status
apache already running
elasticsearch already running
mariadb already running
tomcat already running
```
もし、以下のように出力された場合は以下ワークアラウンドを実行します。
```
sudo /opt/bitnami/ctlscript.sh status
Control file '/etc/gonit/gonitrc' does not exists
```
以下のようにコマンド実行します。
```
sudo mkdir /etc/gonit
sudo sh -c "cat << EOF > /etc/gonit/gonitrc
set httpd port 2812 and
use address localhost
allow localhost
include /etc/monit/conf.d/*.conf
EOF"
sudo chmod 700 /etc/gonit/gonitrc
```
再度以下コマンドを実行します。
```
sudo /opt/bitnami/ctlscript.sh status
```
初回実行時は以下出力ですが、しばらく時間をおいて再実行し、各サービスが起動していることを確認します。[Lab1](../Lab1)を進めてください。
```
sudo /opt/bitnami/ctlscript.sh status
Cannot find any running daemon to contact. If it is running, make sure you are pointing to the right pid file (/var/run/gonit.pid)
sudo /opt/bitnami/ctlscript.sh status
apache already running
elasticsearch already running
mariadb already running
tomcat already running
```

### ［参考］EC2上のliferayサービスの起動、停止、再起動の方法

| 説明 | コマンド |
| --- | --- |
| サービスの確認 | sudo /opt/bitnami/ctlscript.sh status |
| 全サービスの起動 | sudo /opt/bitnami/ctlscript.sh start |
| Apacheのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart apache |
| tomcatのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart tomcat |
| mysqlのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart mysql |
| 全サービスの停止 | sudo /opt/bitnami/ctlscript.sh stop |
| 全サービスの再起動 | sudo /opt/bitnami/ctlscript.sh restart |

