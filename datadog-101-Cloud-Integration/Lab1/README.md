# AWS Integration
AWSとのIntegrationによって、AWS関連サービスのメトリクス、ログが収集可能になり、またAWS環境のセキュリティをモニタリングが可能になります。

ドキュメント：

https://docs.datadoghq.com/ja/integrations/amazon_web_services/

## AWS メトリクス収集設定

メトリクスを Datadog に送信する方法は 2つあります。

メトリクスのポーリング: AWS インテグレーションで利用できる API ポーリングです。CloudWatch API をメトリクス別にクロールしてデータを取得し、Datadog に送信します。新しいメトリクスの取得は平均 10 分毎に行われます。

Kinesis Firehose でのメトリクスストリーム: Amazon CloudWatch Metric Streams と Amazon Kinesis Data Firehose を使用してメトリクスを確認します。注: このメソッドには 2 - 3 分のレイテンシーがあり、別途設定が必要となります。

ここでは、メトリクスのポーリングでの実装を行います。
 
1. Datadog UI上のメニューバーからIntegrationを選択し、検索ボックスから”AWS”を検索し、現れた”Amazon Web Service”をクリック。
2. "+ Add AWS Acoounts"ボタンをクリック
3. Choose a method for adding your AWS account: の項目はデフォルトのAutomatically using CloudFormationを選択のままにする
4. ①Select AWS Regionで、任意のリージョンを選択。（CloudFormationのスタックをどのリージョンに作成するかの選択）
5. ②Add Datadog API Keyはデフォルトのまま
6. 


## AWS ログ収集設定

## AWS セキュリティ（CSPM）設定
TBD

## AWS セキュリティ（SIEM）設定
TBD
