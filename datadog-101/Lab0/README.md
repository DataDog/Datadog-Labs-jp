# EC2 サーバの構築

# サーバ環境の作成

## Amazon EC2 liferay を起動

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



### ［参考］EC2上のサービスの起動、停止、再起動の方法

| 説明 | コマンド |
| --- | --- |
| サービスの確認 | sudo /opt/bitnami/ctlscript.sh status |
| 全サービスの起動 | sudo /opt/bitnami/ctlscript.sh start |
| Apacheのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart apache |
| tomcatのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart tomcat |
| mysqlのみの単一サービスを再起動 | sudo /opt/bitnami/ctlscript.sh restart mysql |
| 全サービスの停止 | sudo /opt/bitnami/ctlscript.sh stop |
| 全サービスの再起動 | sudo /opt/bitnami/ctlscript.sh restart |


以上で事前準備は終了です。
[Lab1](../Lab1)を進めてください。
