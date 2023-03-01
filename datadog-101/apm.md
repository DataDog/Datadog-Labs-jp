# APMの設定

このセクションではAPMを有効化し、アプリケーションのトレースを取得します。
APMの概要、公式マニュアルは以下をご参照ください。
ドキュメント：[APM](https://docs.datadoghq.com/ja/tracing/#pagetitle)

APMの有効化は以下の流れで実施します。

1.トレーサーのダウンロード

2.トレーサーの起動設定

3.アプリケーションの再起動

4.APMの動作確認

## トレーサーのダウンロード

ドキュメント：[トレーサーのダウンロード](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/java/?tab=%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83#%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%84%E3%83%AB%E3%83%A1%E3%83%B3%E3%83%86%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3)

トレーサーを配置するディレクトリに移動します。
```
cd /opt/bitnami/tomcat/bin
```
※今回は上記に配置しますが置き場所に指定はありません。お客様システムの設計に合わせた場所に置いてください。

トレーサーをダウンロードします。
```
sudo wget -O dd-java-agent.jar https://dtdg.co/latest-java-tracer
```

## トレーサーの起動設定
ドキュメント：[トレーサーの起動設定](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/java/?tab=%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E7%92%B0%E5%A2%83#java-%E3%83%88%E3%83%AC%E3%83%BC%E3%82%B5%E3%83%BC%E3%82%92-jvm-%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B)

利用するフレームワークに応じてマニュアルのタブを切り替えてご確認ください。
今回はTomcatを利用したアプリケーションのため、上記マニュアルを参照します。

前セクションで移動した/opt/bitnami/tomcat/binで以下のコマンドを実行してファイルを編集します。
```
sudo vi setenv.sh
```

Tomcatインテグレーションの手順で追加した以下の項目が末尾にあることを確認してください。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1"
```

この項目の末尾に以下の文字列を追記します。
```
-javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar -Ddd.service=liferay -Ddd.env=dev
```

-javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar

上記はトレーサーの起動させる指定です。

-Ddd.service=liferay

上記はDatadog上で表示されるサービス名を定義しています。

-Ddd.env=dev

上記はenvタグをつけて環境を絞り込みやすくするものです。



追記後は以下のような記述になります。
```
export CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9012 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.host=127.0.0.1　-javaagent:/opt/bitnami/tomcat/bin/dd-java-agent.jar -Ddd.profiling.enabled=true -Ddd.service=liferay -Ddd.env=dev"
```

## Tomcatの再起動
起動設定を適用するためにTomcatを再起動します。
```
cd /opt/bitnami
```
```
sudo sh ./ctlscript.sh restart tomcat
```

## APMの動作確認

###Liferayでの操作
各種テレメトリをDatadogに送信するために、LiferayにアクセスしWikiを作成します。

###ServiceMap

・Liferayがあることを確認

・クリックしてOverview

###Service Overview

・Summary

・Resources

・Deployment

・Error Tracking

・Infrastracture

