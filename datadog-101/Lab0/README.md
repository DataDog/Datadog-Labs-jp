# EC2 サーバの構築

# サーバ環境の作成

## Amazon EC2 liferay を起動

- **東京リージョン**のコミュニティAMIにて「**liferay**」を検索し、「****bitnami-liferay-7.4.3-xxxx-linux-debian-11-x86_64-hvm-ebs-nami****」を選択（マイナーバージョンは不問）
- インスタンスタイプは**T2 large** or **T3 large**以上を選択
- **パブリック IPを有効にしてください**
- セキュリティグループは、SSH（22）とHTTP(80)、HTTPS(443)を許可
- 「**高度な詳細**」で「**ユーザーデータ *- optional***」に下記を追加

```bash
#!/bin/bash
rm -f /etc/ssh/sshd_not_to_be_run
systemctl enable ssh
systemctl start ssh
```

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
[Lab1](Lab1)を進めてください。