# APMの設定
Lab1にてAPMの初期設定は完了しています。
以下のコマンドでサービスを再起動し、LiferayにアクセスすることでDatadogのAPMメニュー上でパフォーマンス情報やトレースが表示されます。
```
sudo /opt/bitnami/ctlscript.sh restart
```

このセクションではAPM設定をカスタマイズし、アプリケーションを適切に可視化します。
APMの概要、公式ドキュメントは以下をご参照ください。
ドキュメント：[APM](https://docs.datadoghq.com/ja/tracing/#pagetitle)

## Service名、Env名の設定
ドキュメント：[トレーサーの起動設定](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/java/?tab=%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83#java-%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B5%E3%83%BC%E3%82%92-jvm-%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B)

`/opt/bitnami/tomcat/bin`で以下のコマンドを実行してファイルを編集します。
```
sudo vi setenv.sh
```
Tomcatインテグレーションの手順で追加した以下の項目が末尾にあることを確認してください。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1"
```
以下のオプションを追記します。**Ddd.envの情報で各ご参加者様の環境を論理的に分割致します。（ご自分のイニシャルや愛称）には他のご参加者様と重複しない文字列を入力して下さい。**
```
-Ddd.service=liferay -Ddd.env=（ご自分のイニシャルや愛称）
```

| オプション | 意味 |
| ----|----|
| -Ddd.service=liferay | Datadogのserviceタグを定義 |
| -Ddd.env=（ご自分のイニシャルや愛称） | Datadogのenvタグを定義 |

追記後は以下のような記述になります。
> `”`（ダブルクォーテーション）の位置に注意してください。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1 -Ddd.profiling.enabled=true -Ddd.service=liferay -Ddd.env=my-name"
```

## Tomcatの再起動
起動設定を適用するためにTomcatを再起動します。
```
cd /opt/bitnami
```
```
sudo sh ./ctlscript.sh restart tomcat
```
Tomcatの起動状態を確認します。
```
sudo sh ./ctlscript.sh status
```
正常起動していることを確認します。
```
sudo sh ./ctlscript.sh status
apache already running
elasticsearch already running
mariadb already running
tomcat already running
```
## APMの動作確認

### Liferayでの操作
各種テレメトリをDatadogに送信するために、Liferayにアクセスしスパンを生成します。

今回EC2インスタンス上に展開されているLiferayはWebポータルやWebコンテンツ管理、ドキュメント管理などを行うオープンソースのWebサービスです。ログインを行い、操作を試してみます。

1. SSHターミナル上で以下コマンドを実行します。
```
cat ~/bitnami_credentials
```
以下のような出力が現れるので、中央部に表示されるパスワードをメモします。
```
Welcome to the Liferay packaged by Bitnami

******************************************************************************
The default username and password is 'user@liferay.com' and 'xxxxxxxxxxxxx'.
******************************************************************************

You can also use this password to access the databases and any other component the stack includes.

Please refer to https://docs.bitnami.com/ for more details.
```

2. ChromeなどのWebブラウザを開き http://x.x.x.x にアクセスします。x.x.x.xにはEC2インスタンスのパブリックIPを入力、またhttpsではなく、httpで接続します。
3. 画面右上の"Sign in"をクリックし、 以下のように入力して"Sign in"ボタンをクリックします。
```
Email Address: user@liferay.com  
Password: 上記でメモした内容  
```
3. 利用規約（Terms of Use）を確認し\[I Agree\]をクリックします。
4. Change Passwordで新しいパスワードを入力（2回）
5. パスワードリカバリを登録（Password Recovery Question and Answer）
6. 左上のHome横の□をクリックしメニューを表示
7. \[Content&Data\]のWikiなどの追加を操作


## Datadog UIでの確認

### Service Catalog

Datadogコンソールの左メニューからAPM > Service Catalogを選択します。
画面中央部のenv選択のドロップダウンメニューより、設定したenv:（ご自分のイニシャルや愛称）を選択します。

このように、envタグを利用することで本番環境、開発環境等を分けてモニタリングすることが可能です。

![env](../images/env.png)

Service名が変更され、Liferayと表示されていることを確認します。

![service_catalog](../images/service_catalog.png)


以上でLab3は終了です。
[Lab4](../Lab4)を進めてください。
