# AWS Integration
AWSとのIntegrationによって、AWS関連サービスのメトリクス、ログが収集可能になり、またAWS環境のセキュリティをモニタリングが可能になります。

ドキュメント：

https://docs.datadoghq.com/ja/integrations/amazon_web_services/

## AWS メトリクス収集設定

メトリクスを Datadog に送信する方法は 2つあります。

メトリクスのポーリング: AWS インテグレーションで利用できる API ポーリングです。CloudWatch API をメトリクス別にクロールしてデータを取得し、Datadog に送信します。新しいメトリクスの取得は平均 10 分毎に行われます。

Kinesis Firehose でのメトリクスストリーム: Amazon CloudWatch Metric Streams と Amazon Kinesis Data Firehose を使用してメトリクスを確認します。注: このメソッドには 2 - 3 分のレイテンシーがあり、別途設定が必要となります。

　ここでは、メトリクスのポーリングでの実装を行います。
 
 


## AWS ログ収集設定

## AWS セキュリティ（CSPM）設定
TBD

## AWS セキュリティ（SIEM）設定
TBD
