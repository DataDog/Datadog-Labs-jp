# Lambda 設定 Python（Option）

## Lambda Integration
-   [Serverless Framework](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
-   [AWS SAM](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
-   [AWS CDK](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
-   [Datadog CLI](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
-   [Container Image](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
-   [Custom](https://docs.datadoghq.com/ja/serverless/installation/nodejs?tab=serverlessframework#)
上記の通り、Serverless 環境のセットアップには複数のオプションをご利用いただけますが、下記ハンズオンでは Serverless Framework を取り上げています。

## 1. Serverless Framework 環境のセットアップ
(以下、クライアント PC での作業になります。)
1. [node.js を環境にインストール](https://nodejs.org/ja/download/)
2. `npm install -g serverless` を実行し、Serverless Framework をインストール
3. `serverless config credentials --provider aws --key <YOUR_ACCESS_KEY_ID> --secret <YOUR_ACCESS_KEY_SECRET> --profile <YOUR_USER_NAME>` コマンドで Config を設定 ( 設定値は、aws 上 IAM > Access Management > Users で確認/設定)
4. 下記手順で serverless framework のテンプレートを作成
```
# demo 用 ディレクトリを作成:
$ mkdir serverless-demo
$ cd serverless-demo

# serverless example レポジトリをクローン
$ git clone https://github.com/serverless/examples

# aws-python ディレクトリへ移動
$ cd ./serverless-demo/examples/aws-python

# Datadog Plugin のインストール
$ serverless plugin install --name serverless-plugin-datadog

# serverless.yml に下記パラメータを追記
provider:
  name: aws
  runtime: python3.8
  region: <デプロイ先のリージョン名>
  profile: <上記 YOUR_USER_NAME で指定したプロファイル名>


custom:
  datadog:
    apiKey: <DATADOG_API_KEY>
```

## 2. Lambda Function をデプロイ
$ sls deploy --verbose を実行し、デプロイ

## 3. Lambda の Invocation を実施
$ sls invoke -f hello -l -d "Invoking from command line"

## 4. Datadog 上 で Lambda の実行状況を確認
Infrastructure -> Serverless に上記 Lambda が表示されているか確認してください。

## 5. Lambda 関数の削除
$ sls remove


## (Optional) Covid Stats 関数のデプロイ
handler.py を下記スクリプトに置き換え、再デプロイ/Invocationすると、corona statsのAPIをCrawlしてDatadog Logsへ結果を送信する動作を確認することができます。

※<Datadog API Key> となっている箇所については、API Key に置き換えてください。


```py
import requests
import json
import time

def hello(event, context):

    #countries = ["US", "IT", "ES", "CN", "DE", "FR", "IR", "GB", "CH", "BE", "NL", "TR", "KR", "AT", "CA", "PT", "IL", "BR", "AU", 

    #for testing
    countries = ["US", "JP", "AU"]

    for country in countries:
        covidStatsEndpoint = "https://corona-stats.online/" + country + "?source=2&format=json"
        try:
            rg = requests.get(url=covidStatsEndpoint)
            data = rg.json()
            compact_data = json.dumps(data['data'][0], separators=(',', ':'))
            postLog(compact_data)
            print(country + " data successfully posted")
        except:
            continue

    compact_data = json.dumps(data['worldStats'], separators=(',', ':'))
    postLog(compact_data)
    print("world data successfully posted")

def postLog(inLog):
    logIntakeEndpoint = "https://http-intake.logs.datadoghq.com/v1/input/<Datadog API Key>?ddsource=lambda&service=covid19-stats-crawler-min"
    ddLogIntakeHeader = {'Content-Type':'application/json'}
    rp = requests.post(url=logIntakeEndpoint, data=inLog, headers=ddLogIntakeHeader)

if __name__ == "__main__":
    hello('','')
```

## 6. Lambda の Invocation を実施
$ sls invoke -f hello

## 7. Datadog 上 で Lambda の実行状況を確認
Infrastructure -> Serverless に上記 Lambda が表示されているか確認してください。

## 8. Datadog 上 で Log の出力状況を確認
Log -> Search で上記 Lambda のログが出力されていることを確認してください。

## 8. Lambda 関数の削除
$ sls remove
