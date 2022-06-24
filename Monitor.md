# Create Monitor

## 

## Steps

1. Make directory  `./Datadog/Monitor`

ディレクトリは自由に定義できますが、本ハンズオンでは以下のようにします。
```
TERRAFORM
|--Datadog
   |--Monitor
```

2. Make `main.tf` under `./Datadog` 

環境変数でAPIKEY/APPKEYが設定されていれば不要です。

``` 
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}
provider "datadog" {
  api_key = own_APIKEY
  app_key = own_APPKEY
}
```

3.Make `metrics_monitor.tf` under `./Datadog/Monitor`

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



5. Open the terminal from Terminal >> new Terminal (Not necessary if already open)

6. Change current directory `% cd Datadog/Monitor`

7. Run command `% terraform init` to initialize

8. Take a look `Terraform has been successfully initialized!` is appeared.

9. If you have an error, need to edit tf file then exec `% terraform plan` until without error.

10. Run command `% terraform apply` to create Monitor.

11. Enter a value `yes`
```
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

14. Try to create others.

ここはあとから記載予定
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
 