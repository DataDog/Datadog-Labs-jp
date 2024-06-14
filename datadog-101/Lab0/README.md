# EC2 サーバの構築

# サーバ環境の作成

## Amazon EC2 liferayを起動
- [AWS management consoleのAMIカタログ](https://ap-northeast-1.console.aws.amazon.com/ec2/home?region=ap-northeast-1#AMICatalog:)でコミュニティAMIにて最新のLiferay AMIを検索し最上部のイメージを選択
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

## liferayサービスの確認
お好きなSSHターミナルを開き作成されたインスタンスへSSH接続します。x.x.x.xにはインスタンスへ割り当てられたパブリックIP、x.x.x.x.pemには作成時割り当てたキーファイルを入力してください。
**SSHユーザ名はEC2画面上に表示される"admin"ではなく、"bitnami"であることに注意してください。**
```
ssh -l bitnami x.x.x.x -i xxxx.pem
```
PEMファイルの権限設定でエラーが出た場合はchmodコマンドを実行し、権限を正しく設定します。
```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'xxxx.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "xxxx.pem": bad permissions
Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
```
```
chmod 400 xxxx.pem
```

以下のコマンドを実行し、liferayを構成する各サービスが起動していることを確認します
```
sudo /opt/bitnami/ctlscript.sh status
```
以下のように出力されれば正常にサービスが起動しています。SSHターミナルを開いたままで残し[Lab1](../Lab1)を進めてください。そうでなければ以下ステップを実行してください。
```
sudo /opt/bitnami/ctlscript.sh status
apache already running
elasticsearch already running
mariadb already running
tomcat already running
```
もし、以下のように出力された場合は以降のワークアラウンドを実行します。
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
初回実行時は以下出力ですが、しばらく時間をおいて再実行し、各サービスが起動していることを確認します。SSHターミナルを開いたままで残し[Lab1](../Lab1)を進めてください。
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

