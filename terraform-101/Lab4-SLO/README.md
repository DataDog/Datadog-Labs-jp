# Lab4 - SLO

In this Lab, we will use Terraform to set up SLOs using the Synthetic test we just created.

## Create Monitor-based SLO

1. Open `Lab4-SLO/slo.tf` on VS Code.

2.  Modify the `slo.tf` file according to the following table.

See [datadog_service_level_objective (Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/service_level_objective) if necessary.


|  key  |  value  | explanation |
| ---- | ---- | --- |
|  type  |  monitor  | (String) The type of the service level objective. The mapping from these types to the types found in the Datadog Web UI can be found in the Datadog API documentation page. Valid values are `metric`, `monitor`.  |
|  monitor_ids  | (Monitor ID from Lab3)   |  (Set of Number) A static set of monitor IDs to use as part of the SLO |


```
resource "datadog_service_level_objective" "slo" {
  name = "slo from terraform"
  type = ""
  monitor_ids = []
}
```

3. Set thresholds

Add blocks according to the following table.

*Note: "threshols" block should be under the "resource" block!"*

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
$ cd ../Lab4-SLO
$ terraform init
```

5. Apply your configuration to create a new synthetic monitor. Remember to confirm your apply with a `yes`.

```
$ terraform apply -var-file ../terraform.tfvars
```

6. Navigate to the [SLO page](https://app.datadoghq.com/slo) to view your SLO.

## Enable SLO ID to output

1. Add the following code to the `slo.tf` file 

*Note: "output" block should be same level to the "resource" block!"*

```
output "datadog_service_level_objective_id" {
  value = datadog_service_level_objective.slo.id
}
```

1. Apply your configuration. Remember to confirm your apply with a `yes`.

```
$ terraform apply -var-file ../terraform.tfvars
```

3. Confirm that the slo id is output

(Sample)
```
Outputs:

datadog_service_level_objective_id = "be16397c22dd54e9933edb91a90f559e"
```

Please make a note of this as it will be used in the next Lab.

### Fantasitic! Let's go to final lab! [Lab5](./../Lab5-Dashboard/README.md)