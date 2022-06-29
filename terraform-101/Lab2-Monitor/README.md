# Lab2 - Create Monitor

In this Lab, you will create a metrics monitor using Terraform.

## Create .tf file
1. Open `metrics_monitor.tf` on Visual Studio Code.

2. Edit `metrics_monitor.tf` as follows then save the file.

``` 
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

1. Create new Monitor(details below) referring to [Datadog_monitor(Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor)

> ### Monitor configuration：
> - Choose the detection method: Threshold Alert
> - Define the Metric: 
> 	- system.cpu.system from your EC2 host
> - Set Alert conditions
> 	- Alert threshold > 90% (recovery 80%)
> 	- Warning threshold > 70% (recovery 50%)
> 	- Do not Notify if data is missing
> - Notify your team
> 	- title: CPU Monitor
> 	- message: mention to yourself, CPU usage is high {{your_host_id}}
> 	- If this monitor stay Alert and Nodata renotify every 30 minutes
> 	- tag:
> 		- terraform:true
> 		- team:cake
> 		- sub_team:APAC_sales_engineer
> - Define permission and auditnotifications
> 	- priority:Not Defined


```
# template

resource "datadog_monitor" "cpumonitor" {

#Required
  name = "cpu monitor - terraform"
  type = "query alert"
  message = "???????????????????????????????????????"
  query = "max(last_5m):avg:system.cpu.system{host:i-03af36e2fb6fc90c5} > 90"

#Optional
  monitor_thresholds {
    ???? = ??
    ???? = 80
    ???? = 70
    ???? = ??

  }
  ????? = false
  priority = null
  restricted_roles = null

  include_tags = ????
  tags = ["terraform:true" , ????, ????]
  
}
```

## Running terraform

1. Change current directory 
```
$ cd ../Lab2-Monitor
```

2. initialize terraform

```
$ terraform init 
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.20.0

Terraform has been successfully initialized!
```

3. Run Terraform to create Monitor.

```
$ terraform apply -var-file ../terraform.tfvars
```

4.  Enter a value `yes`

	you can see and check the execution plan.

<details>
<summary>Hint</summary>

```
$ terraform apply -var-file ./../terraform.tfvars
datadog_monitor.cpumonitor: Refreshing state... [id=74529286]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

  # datadog_monitor.cpumonitor2 will be created
  + resource "datadog_monitor" "cpumonitor" {
      + evaluation_delay    = (known after apply)
      + id                  = (known after apply)
      + include_tags        = true
      + message             = <<-EOT
            @jane.doe@datadoghq.com
            CPU usage is high host:{{host.name}}
        EOT
      + name                = "cpu monitor - terraform"
      + new_host_delay      = 300
      + notify_audit        = false
      + notify_no_data      = false
      + query               = "max(last_5m):avg:system.cpu.system{host:i-03af36e2fb6fc90c5} > 90"
      + require_full_window = true
      + tags                = [
          + "sub_team:apac_salesEngineer",
          + "team:cake",
          + "terraform:true",
        ]
      + type                = "query alert"

      + monitor_thresholds {
          + critical          = "90"
          + critical_recovery = "80"
          + warning           = "70"
          + warning_recovery  = "50"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
  Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

```
</details>

12. Confirm Monitor created.

13. Navigate to the [Monitor page](https://app.datadoghq.com/monitors/manage) to view your monitor.

14. If you have much time, try to create other monitors.

---
### Well done! Go to [Lab3](./../Lab3-Synthetics/README.md)!
