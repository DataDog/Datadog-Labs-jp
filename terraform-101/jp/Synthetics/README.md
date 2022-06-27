# Synthetics Monitoring

このLabではTerraformを使ってSynthetics Testを作成します。

## APIテストの作成

1. 以下の表にしたがって、`synthetics.tf`ファイルを修正してください。

|  項目  |  value  | 説明 |
| ---- | ---- | --- |
|  type  |  api  |  (String) Synthetics test type. Valid values are api, browser. |
|  subtype  |  http  | (String) The subtype of the Synthetic API test. Defaults to http. Valid values are http, ssl, tcp, dns, multi, icmp, udp, websocket. |
|  method  |  GET  | (String) The HTTP method. Valid values are GET, POST, PATCH, PUT, DELETE, HEAD, OPTIONS |
|  url  |  http://api.shopist.io  |  (String) The URL to send the request to. |
|  locations  |  aws:ap-southeast-2  |  (Set of String) Array of locations used to run the test. Refer to Datadog documentation for available locations (e.g. aws:eu-central-1). |
| status | live | (String) Define whether you want to start (live) or pause (paused) a Synthetic test. Valid values are live, paused. |


```
terraform {
 required_providers {
   datadog = {
       source = "Datadog/datadog"
   }
 } 
}

provider "datadog" {
 api_key = "var.datadog_api_key"
 app_key = "var.datadog_app_key"
}

resource "datadog_synthetics_test" "api-test" {
    name = "terraform API test"
    type = ""
    subtype = ""
    locations = [""]

    request_definition {
        method  = ""
        url     = ""    
    }
 
    message = "Error occured!"

    status = ""
}
```

2. Define assertions

Define assertions of what an expected test results are.

以下の表に従ってブロックを追記します。

|  項目  |  value  | 説明 |
| ---- | ---- | --- |
|  type  |  statusCode  | (String) Type of assertion. Note Only some combinations of type and operator are valid (please refer to Datadog documentation). Valid values are body, header, statusCode, certificate, responseTime, property, recordEvery, recordSome, tlsVersion, minTlsVersion, latency, packetLossPercentage, packetsReceived, networkHop, receivedMessage.|
|  operator  |  is  | (String) Assertion operator. Note Only some combinations of type and operator are valid (please refer to Datadog documentation).|
|  target  |  200  | (String) Expected value. Depends on the assertion type, refer to Datadog documentation for details. |

```
    assertion {
        type        = "statusCode"
        operator    = "is"
        target     = "200"
    }
```

3. Specify test frequency

以下の表にしたがってブロックを追記します。

|  項目  |  value  | 説明 |
| ---- | ---- | --- |
| tick_every | 900 |  (Number) How often the test should run (in seconds).|
| min_location_failed | 1 | (Number) Minimum number of locations in failure required to trigger an alert. Default is 1.|

```
    options_list {
        tick_every      = 900
        min_location_failed =  1
     }
```


4. Initialize your configuration.

```
$ terraform init
```

5. Apply your configuration to create a new synthetic monitor. Remember to confirm your apply with a `yes`.

```
$ terraform apply
```


6. Navigate to the [Synthetics page](https://app.datadoghq.com/synthetics/tests) to view your test.



## Modify test

1. ファイルを修正し、以下のように変更します

- テスト間隔を900秒（15分）から60秒に変更
- テストロケーションに`ap-northeast-1`を追加


2.  変更箇所を確認

```
$ terraform plan
```

3. 変更内容が問題ないことが確認できたので、実行

```
$ terraform apply
```

4. Navigate to the [Synthetics page](https://app.datadoghq.com/synthetics/tests) to verify your test is modified.



## Reference
[Resource (datadog_synthetics_test)](
https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test)