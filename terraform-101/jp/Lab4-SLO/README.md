# SLO

In this Lab, we will use Terraform to set up SLOs using the Synthetic test we just created.

## Open .tf file

Change directory to Synthetics folder and open `slo.tf` in VS Code.

```
$ cd /Datadog-Labs-jp/terraform-101/en/SLO
$ code slo.tf
```

## Create Monitor-based SLO

前のLabで作成したSynthetic testを使ってSLOを作成します。

1.  Modify the `slo.tf` file according to the following table.

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  type  |  monitor  | (String) The type of the service level objective. The mapping from these types to the types found in the Datadog Web UI can be found in the Datadog API documentation page. Valid values are `metric`, `monitor`.  |
|  monitor_ids  |    |  (Set of Number) A static set of monitor IDs to use as part of the SLO |


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

resource "datadog_service_level_objective" "slo" {
  name = "slo from terraform"
  type = ""
  monitor_ids = []
}
```

2. Set thresholds

Add blocks according to the following table.

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  timeframe  |  7d  |  (String) The time frame for the objective. The mapping from these types to the types found in the Datadog Web UI can be found in the Datadog API documentation page. Valid values are `7d`, `30d`, `90d`, `custom`. |
|  target  |  99.9  |   (Number) The objective's target in[0,100]. |
|  warning |  99.99  | (Number) The objective's warning value in [0,100]. This must be greater than the target value.|

```
  thresholds {
    timeframe = ""
    target    = 
    warning   = 
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


6. Navigate to the [SLO page](https://app.datadoghq.com/slo) to view your SLO.


## Reference
[datadog_service_level_objective (Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/service_level_objective)
