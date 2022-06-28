# Lab-2 Create Monitor

## 

## Steps

1. Change current directory ```% cd /Datadog/Monitor```

2. Make main.tf as ```% code main.tf``` 


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

3. Make metrics_monitor.tf as `% code metrics_monitor.tf`

4. Create new Monitor(details below) refer to the [Datadog_monitor(Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor)

> ### Monitor configuration：
> - Choose the detection method: Threshold Alert
> - Define the Metric: 
> 	- system.cpu.system from yourhost
> - Set Alert conditions
> 	- Alert threshold > 90% (recovery 80%)
> 	- Warning threshold > 70% (recovery 50%)
> 	- Do not Notify if data is missing
> - Notify your team
> 	- title CPU Monitor
> 	- messaget: mention to yourself, CPU usage is high {{your_host_id}}
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

#required
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



5. Open the terminal from on the menu bar (Terminal >> new Terminal) Not necessary if already open.


6. Run command `% terraform init` to initialize

```
nobuyuki.kawazu@COMP-C02G43ELML87 Monitor % terraform init                                

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of datadog/datadog from the dependency lock file
- Using previously-installed datadog/datadog v3.12.0

Terraform has been successfully initialized!
```

7. Take a look `Terraform has been successfully initialized!` is appeared.


8. Run command `% terraform apply -var-file ./../terraform.tfvars` to create Monitor.

11. Enter a value `yes`

	you can see and check the execution plan.
```
  nobuyuki.kawazu@COMP-C02G43ELML87 Monitor % terraform apply -var-file ./../terraform.tfvars
datadog_monitor.cpumonitor: Refreshing state... [id=74529286]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

  # datadog_monitor.cpumonitor2 will be created
  + resource "datadog_monitor" "cpumonitor2" {
      + evaluation_delay    = (known after apply)
      + id                  = (known after apply)
      + include_tags        = true
      + message             = <<-EOT
            @nobuyuki.kawazu@datadoghq.com
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

12. Confirm Monitor created completly
```
datadog_monitor.cpumonitor: Modifying... [id=74529286]
datadog_monitor.cpumonitor: Modifications complete after 0s [id=74529286]


Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```


13. Open Datadog Application and check your monitor.

14. If you have much time, try to create other monitors.

---
### End of Lab-2
