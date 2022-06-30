# Lab3 - Synthetics Monitoring

In this Lab, you will create a Synthetics test using Terraform.


## Create API test
1. Open `synthetics.tf` on VS Code.


2. Modify the `synthetics.tf` file according to the following table.

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  type  |  api  |  (String) Synthetics test type. Valid values are `api`, `browser`. |
|  subtype  |  http  | (String) The subtype of the Synthetic API test. Defaults to http. Valid values are `http`, `ssl`, `tcp`, `dns`, `multi`, `icmp`, `udp`, `websocket`. |
|  method  |  GET  | (String) The HTTP method. Valid values are `GET`, `POST`, `PATCH`, `PUT`, `DELETE`, `HEAD`, `OPTIONS` |
|  url  |  https://api.shopist.io  |  (String) The URL to send the request to. |
|  locations  |  aws:ap-southeast-2  |  (Set of String) Array of locations used to run the test. Refer to Datadog documentation for available locations (e.g. `aws:eu-central-1`). |
| status | live | (String) Define whether you want to start (`live`) or pause (`paused`) a Synthetic test. Valid values are live, paused. |


```
terraform {
  required_providers {
    datadog = {
       source = "Datadog/datadog"
    }
  } 
}

provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
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

3. Define assertions

Define assertions of what an expected test results are.

Add blocks according to the following table.

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  type  |  statusCode  | (String) Type of assertion. Note Only some combinations of type and operator are valid (please refer to Datadog documentation). Valid values are `body`, `header`, `statusCode`, `certificate`, `responseTime`, `property`, `recordEvery`, `recordSome`, `tlsVersion`, `minTlsVersion`, `latency`, `packetLossPercentage`, `packetsReceived`, `networkHop`, `receivedMessage`.|
|  operator  |  is  | (String) Assertion operator. Note Only some combinations of type and operator are valid (please refer to Datadog documentation).|
|  target  |  200  | (String) Expected value. Depends on the assertion type, refer to Datadog documentation for details. |

```
    assertion {
        type        = ""
        operator    = ""
        target      = ""
    }
```

4. Specify test frequency

Add blocks according to the following table.

|  項目  |  value  | 説明 |
| ---- | ---- | --- |
| tick_every | 900 |  (Number) How often the test should run (in seconds).|
| min_location_failed | 1 | (Number) Minimum number of locations in failure required to trigger an alert. Default is 1.|

```
    options_list {
        tick_every      = 
        min_location_failed =  
     }
```


5. Initialize your configuration.

```
$ cd ../Lab3-Synthetics
$ terraform init
```

6. Apply your configuration to create a new synthetic monitor. Remember to confirm your apply with a `yes`.

```
$ terraform apply -var-file ../terraform.tfvars
```


7. Navigate to the [Synthetics page](https://app.datadoghq.com/synthetics/tests) to view your test.


## Enable Monitor ID to output

The `id` output when executed is the ID of this resource, not the Monitor ID of the Datadog; edit the file to obtain the Monitor ID.

1. Add the following code to the `synthetics.tf` file 

```
output "datadog_synthetics_test_id" {
  value = datadog_synthetics_test.api-test.monitor_id
}
```

2. Apply your configuration. Remember to confirm your apply with a `yes`.

```
$ terraform apply -var-file ../terraform.tfvars
```

3. Confirm that the monitor id is output

```
Outputs:

datadog_synthetics_test_id = 74938804
```

Please make a note of this as it will be used in the next Lab.

## (Optional)Modify test

1. Modify the file and change it as follows

- Changed test interval from 900 seconds (15 minutes) to 60 seconds
- Added `ap-northeast-1` to location
- Added assertion that the response time is less than 3000 ms．

<details>
<summary>Hint</summary>

```
# Added assertion that the response time is less than 3000 ms．
   assertion {
        type        = "responseTime"
        operator    = "lessThan"
        target      = "3000"
    }
```

</details>


1.  check for changes

```
$ terraform plan
```

3. If the changes are OK, apply the configuration.

```
$ terraform apply -var-file ../terraform.tfvars
```

4. Navigate to the [Synthetics page](https://app.datadoghq.com/synthetics/tests) to verify your test is modified.



### Great job! Go to [Lab4](./../Lab4-SLO/README.md) 

## Reference
[Resource (datadog_synthetics_test)](
https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test)