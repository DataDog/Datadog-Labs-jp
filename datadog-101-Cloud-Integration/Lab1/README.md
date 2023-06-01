# AWS Integration
AWSとのIntegrationによって、AWS関連サービスのメトリクス、ログが収集可能になり、またAWS環境のセキュリティをモニタリングが可能になります。

ドキュメント：

https://docs.datadoghq.com/ja/integrations/amazon_web_services/

## AWS メトリクス収集設定

メトリクスを Datadog に送信する方法は 2つあります。

+ メトリクスのポーリング

AWS インテグレーションで利用できる API ポーリングです。CloudWatch API をメトリクス別にクロールしてデータを取得し、Datadog に送信します。新しいメトリクスの取得は平均 10 分毎に行われます。

+ Kinesis Firehose でのメトリクスストリーム

Amazon CloudWatch Metric Streams と Amazon Kinesis Data Firehose を使用してメトリクスを確認します。注: このメソッドには 2 - 3 分のレイテンシーがあり、別途設定が必要となります。

ここでは、メトリクスのポーリングでの実装を行います。
 
1. Datadog UI上のメニューバーからIntegrationを選択し、検索ボックスから”AWS”を検索し、現れた”Amazon Web Service”をクリック
2. "+ Add AWS Acoounts"ボタンをクリック
3. Choose a method for adding your AWS account: の項目はデフォルトのAutomatically using CloudFormationを選択のままにする
4. ①Select AWS Regionで、任意のリージョンを選択。（CloudFormationのスタックをどのリージョンに作成するかの選択）
5. ②Add Datadog API Keyはデフォルトのまま
6. ③Send AWS Logs to DatadogはデフォルトのままYes
7. ④Enable Cloud Security Posture ManagementでYesを選択
8. 画面右下のLaunch Cloud Formation Templateをクリック
9. AWSのマネジメントコンソールにリダイレクトされるので、ご用意いただいたアカウントでログイン
10. スタックの名前やIAM Role名等変更が可能だが、今回は全てデフォルトのままとする
11. 画面下部の”機能”の欄に表示されている”承認します”のチェックボックスにチェックを入れ、スタックの作成をクリック
12. スタックが完了したらAWS Integrationの設定は完了です

## AWS メトリクス収集確認
Integrationが設定されたことによりCloud WatchメトリクスのデータがDatadog上で確認可能となります。

ここではどのようにデータが確認できるのかの確認と、データ収集対象の設定方法の確認を行います

### 収集データの確認

1. Datadog UI上のメニューバーからDashboards - listを選択
2. 検索バーに"AWS"と入力
3. AWS Overviewを選択
4. AWSの各種リソースからメトリクスが収集され、可視化されていることを確認

　　※データが収集されてくるまで時間がかかります。この時点で表示されていない場合は、次の手順を先に実行してください。
    
### データ収集対象の設定方法の確認

1. Integrationメニューから再度AWSを検索し、Amazon Web Serviceを選択
2. 接続されたアカウントに対する収集設定が行える画面になっていることを確認
3. Metric Collectionタブを選択
4. "Collect Standard CloudWatch Metrics from AWS Services"ここで収集対象のサービスをトグルで選択できることを確認
5. その下の"Limit Metric Collection to Specific Resources"にて、Select AWS Serviceプルダウンをクリック

　　※このプルダウンで表示されるリソースに関しては、タグレベルで収集対象を選択可能です。

以上でIntegrationの設定は完了です。

## AWS ログ収集設定

AWS サービス ログを Datadog に送信するには 2 つの方法があります。

+ Kinesis Firehose 宛先

Kinesis Firehose 配信ストリームで Datadog 宛先を使用して、ログを Datadog に転送します。CloudWatch から大量のログを送信する場合は、このアプローチを使用することをお勧めします。

+ フォワーダー Lambda 関数

Datadog フォワーダー Lambda 関数をデプロイします。これは、S3 バケットまたは CloudWatch ログ グループをサブスクライブし、ログを Datadog に転送します。Datadogでは、S3 またはKinesisにデータを直接ストリーミングできない他のリソースからログを送信する場合にも、このアプローチを使用することをお勧めします。

ここでは、フォワーダーを利用したログ転送を実装します。

ドキュメント：　https://docs.datadoghq.com/ja/logs/guide/send-aws-services-logs-with-the-datadog-lambda-function/?tab=aws%E3%82%B3%E3%83%B3%E3%82%BD%E3%83%BC%E3%83%AB

### AWSサービスログをDatadogへ送信

ドキュメント：

https://docs.datadoghq.com/ja/logs/guide/send-aws-services-logs-with-the-datadog-lambda-function/?tab=aws%E3%82%B3%E3%83%B3%E3%82%BD%E3%83%BC%E3%83%AB#aws-%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E3%81%AE%E3%83%AD%E3%82%B0%E3%82%92%E6%9C%89%E5%8A%B9%E3%81%AB%E3%81%99%E3%82%8B

上記ドキュメントをご参照いただくと、サービス毎の収集方法をまとめた表があります。

ここでは、自動で収集できるものに対して設定を行います。

ま

1. 任意の設定でS3バケットを作成する
2. S3バケットでアクセスログの収集を有効化

参考ドキュメント：
https://docs.datadoghq.com/ja/integrations/amazon_s3/#s3-%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%83%AD%E3%82%B0%E3%81%AE%E6%9C%89%E5%8A%B9%E5%8C%96



### AWS S3に格納されるログをDatadogへ送信

## AWS セキュリティ（CSPM）設定
TBD

## AWS セキュリティ（SIEM）設定
TBD
