# APMの設定

このセクションではAPMを有効化し、アプリケーションのトレースを取得します。
APMの概要、公式ドキュメントは以下をご参照ください。
ドキュメント：[APM](https://docs.datadoghq.com/ja/tracing/#pagetitle)

APMの有効化は以下の流れで実施します。

1.トレーサーのダウンロード

2.トレーサーの起動設定

3.アプリケーションの再起動

4.Datadog UI上でAPMの動作確認

## トレーサーのダウンロード

ドキュメント：[トレーサーのダウンロード](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/java/?tab=%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83#%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%84%E3%83%AB%E3%83%A1%E3%83%B3%E3%83%86%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3)

トレーサーを配置するディレクトリに移動します。
```
cd /opt/bitnami/tomcat/bin
```
> ※今回は上記に配置しますが置き場所に指定はありません。システムごとの設計に合わせた場所に置いてください。

トレーサーをダウンロードします。
```
sudo wget -O dd-java-agent.jar https://dtdg.co/latest-java-tracer
```

## トレーサーの起動設定
ドキュメント：[トレーサーの起動設定](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/java/?tab=%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83#java-%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B5%E3%83%BC%E3%82%92-jvm-%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B)

利用するフレームワークに応じてマニュアルのタブを切り替えて確認してください。
今回はTomcatを利用したアプリケーションを利用します。

前セクションで移動した`/opt/bitnami/tomcat/bin`で以下のコマンドを実行してファイルを編集します。
```
sudo vi setenv.sh
```
Tomcatインテグレーションの手順で追加した以下の項目が末尾にあることを確認してください。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1"
```
この項目の末尾に以下の文字列を追記します。**Ddd.envの情報で各ご参加者様の環境を論理的に分割致します。（ご自分のイニシャルや愛称）には他のご参加者様と重複しない文字列を入力して下さい。**
```
-javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar -Ddd.service=liferay -Ddd.env=（ご自分のイニシャルや愛称）
```

| オプション | 意味 |
| ----|----|
| -javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar| トレーサーの起動設定 |
| -Ddd.service=liferay | Datadogのserviceタグを定義 |
| -Ddd.env=dev | Datadogのenvタグを定義 |

追記後は以下のような記述になります。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1 -javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar -Ddd.profiling.enabled=true -Ddd.service=liferay -Ddd.env=su"
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

### Agentの状態確認
DatadogエージェントでAPMデータが収集されていることを確認します。
```
sudo datadog-agent status
```
APM Agentのセクションが以下のようになっていれば収集が成功しています。
```
=========
APM Agent
=========
  Status: Running
  Pid: 7907
  Uptime: 445103 seconds
  Mem alloc: 13,787,976 bytes
  Hostname: i-0833dcd1bfe204735
  Receiver: localhost:8126
  Endpoints:
    https://trace.agent.datadoghq.com

  Receiver (previous minute)
  ==========================
    From java 11.0.18 (OpenJDK 64-Bit Server VM), client 1.11.2~4e957fc01e
      Traces received: 216 (113,967 bytes)
      Spans received: 221
```
### Liferayでの操作
各種テレメトリをDatadogに送信するために、LiferayにアクセスしWikiを作成します。

### ServiceMap
以下の各機能はこちらのドキュメントを参照しながらご確認ください。
https://docs.datadoghq.com/ja/tracing/glossary/#pagetitle

Datadogコンソールの左メニューからAPMメニューを展開し、Service Mapを選択します。
画面中央部のenv選択のドロップダウンメニューより、設定したenv:（ご自分のイニシャルや愛称）を選択します。



- Liferayとその依存サービスが見えていることを確認
- LiferayをクリックしてOverviewを選択

### Service Overview
以下の各項目をご確認ください。
- Summary
- Resources
- Deployment
- Error Tracking
- Infrastracture

以上でLab3は終了です。
[Lab4](../Lab4)を進めてください。
