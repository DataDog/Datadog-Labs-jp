# Lab2 - Create Monitor

In this Lab, you will create a metrics monitor using Terraform.

## Create .tf file
1. Open `Lab2-Monitor/metrics_monitor.tf` on Visual Studio Code.

2. `metrics_monitor.tf` is incomplete as some elements are missing. Replace the ???? area to the appropriate content. 

   Referring to [Datadog_monitor(Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor), create new Monitor(details below).

### Monitor configuration：
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
> - Tags:
> 	- terraform:true
> 	- team:cake
> 	- sub_team:APAC_sales_engineer
> - Define permission and auditnotifications
> 	- priority:Not Defined


```
# template

resource "datadog_monitor" "cpumonitor" {

#Required
  name = "cpu monitor - terraform"
  type = "query alert"
  message = "???????????????????????????????????????"
  query = "max(last_5m):avg:system.cpu.user{host:i-03af36e2fb6fc90c5} > 90"

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

<details>
<summary>Hint</summary>

```
resource "datadog_monitor" "cpumonitor2" {
  name = "cpu monitor - terraform"
  type = "query alert"
  message = "@njane.doe@examplecom\nCPU usage is high host:{{host.name}}"
  query = "max(last_5m):avg:system.cpu.system{host:i-03af36e2fb6fc90c5} > 90"
  
  monitor_thresholds {
    critical          = 90
    critical_recovery = 80
    warning           = 70
    warning_recovery  = 50
  }
  notify_audit = false
  notify_no_data = false
  priority = null
  restricted_roles = null

  include_tags = true
  tags = ["terraform:true" , "team:cake", "sub_team:apac_salesEngineer"]
}
```
</details>

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

5.  Confirm Monitor created.

6.  Navigate to the [Monitor page](https://app.datadoghq.com/monitors/manage) to view your monitor.

## Trigger the monitor

Stress on your EC2 and check the status of Monitor, and whether notification was sent.

1. SSH to your EC2

2. install stress tool on your EC2.

		bitnami@ip-172-31-38-248:~$ sudo apt-get install stress

3. stress on your EC2.

		bitnami@ip-172-31-38-248:~$ sudo stress -c 1 

	c. Check your Monitor transition to  Alert or Warning and stop the stressing. To finish, press `Ctl + c`
		

---
### Well done! Go to [Lab3](./../Lab3-Synthetics/README.md)!
