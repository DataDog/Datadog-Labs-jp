# APMの設定

このセクションではAPMを有効化し、アプリケーションのトレースを取得します。
APMの概要、公式ドキュメントは以下をご参照ください。
ドキュメント：[APM](https://docs.datadoghq.com/ja/tracing/#pagetitle)

## トレーサーのダウンロード

ドキュメント：[トレーサーのダウンロード](https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/dotnet-core/?tab=otherenvironments)

以下のURLをコピーし、Windows Server内のブラウザに貼り付けトレーサーをダウンロードします。
https://github.com/DataDog/dd-trace-dotnet/releases/download/v2.30.0/datadog-dotnet-apm-2.30.0-x64.msi

※ブラウザの設定でダウンロードできない場合、ブラウザの歯車ボタンからInternet Option - Security - Internet - Custom Level - Downloadを有効にして下さい

IISの再起動を行います。

```
net stop /y was
net start w3svc
```
IISのトレースデータ取得に必要な設定は以上です。

## APMの動作確認

### Agentの状態確認
APMデータが収集されていることを確認します。

Datadog Agent Manager のStatusで、APM Agentのセクションが以下のようになっていれば収集が成功しています。
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
```

### トレースデータの送信
ローカル端末から以下URLにアクセスします。
```
http://サーバのパブリックIP/employe.aspx
```

## Datadog UIでの確認

### ServiceMap

Datadogコンソールの左メニューからAPMメニューを展開し、Service Mapを選択します。

- default web site等のサービスが表示されていることを確認

（オプション）
今回、複数台のサーバで全く同じ設定でAPMを実装しているため、一つのサービスに複数台からのメトリクスが集約されて表示されています。

自身のサーバの情報を独立して確認したい場合は以下のURLを参考に環境変数DD_ENVを任意の値で設定することで可能です。

https://docs.datadoghq.com/ja/tracing/trace_collection/dd_libraries/dotnet-core/?tab=containers#iis

- default web siteをクリックしてOverviewを選択

### Service Overview
リクエスト数やレイテンシーが表示されています。

### Traces
上記のメニュから`Traces`を選択します。

トレースの一覧が表示されますので、どれか1つをクリックして中身を確認してください。

以上でLab3は終了です。
[Lab4](../Lab4)を進めてください。

