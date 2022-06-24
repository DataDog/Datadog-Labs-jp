# Metics Monitorの作成

## 

## 手順

1. Make directory  Datadog/Monitor

ディレクトリは自由に定義できますが、本ハンズオンでは以下のようにします。
```
TERRAFORM
 > Datadog
  > Monitor
```

2. Make main.tf under `Datadog`

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

3.Make metrics_monitor.tf under `Monitor`
XXXを参照しながら、以下のモニターを作成します。

モニターの設定値：

XXXXXXXXXX

XXXXXXXXXX

XXXXXXXXXX


```

##template##

resource "datadog_monitor" "cpumonitor" {

  name = "cpu monitor - terraform"
  type = "metric alert"
  message = "Created via terraform"
  query = "max(last_5m):100 - avg:system.cpu.idle{*} by {host,name} > 90"
  monitor_thresholds {
    critical = 90
    critical_recovery = 60

  }
  notify_no_data = false

  
}
```

4. Open the terminal from Terminal >> new Terminal (Not necessary if already open)

5. Change current directory `% cd Datadog/Monitor`

5. Run command `% terraform init` to initialize

6. Valid `Terraform has been successfully initialized!` is appeared.

7. Run command `% terraform apply` to create Monitor.

8. Valid 

![result](https://a.cl.ly/7Ku6Plk9)

9. Valid Monitor on Datadog Application. 

10. If you have time, refer to the link and try to create other monitor types.
