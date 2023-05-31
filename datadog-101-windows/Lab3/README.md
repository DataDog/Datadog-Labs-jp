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

### 
各種テレメトリをDatadogに送信するために、LiferayにアクセスしWikiを作成します。


## Datadog UIでの確認

### ServiceMap

Datadogコンソールの左メニューからAPMメニューを展開し、Service Mapを選択します。
画面中央部のenv選択のドロップダウンメニューより、設定したenv:（ご自分のイニシャルや愛称）を選択します。

![env](https://github.com/DataDog/Datadog-Labs-jp/blob/main/datadog-101/images/env.png)

- Liferayとその依存サービスが見えていることを確認
- LiferayをクリックしてOverviewを選択

### Service Overview
リクエスト数やレイテンシーが表示されています。

### Traces
上記のメニュから`Traces`を選択します。

トレースの一覧が表示されますので、どれか1つをクリックして中身を確認してください。

以上でLab3は終了です。
[Lab4](../Lab4)を進めてください。

