# Lab5 - Dashboard

In this Lab, you will create a Dashboard using Terraform.

## Create Dashboard

1. Open `dashboard.tf` on VS Code.

2. Modify the `dashboard.tf` file according to the following table.

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  layout_type  |  ordered  | (String) The layout type of the dashboard. Valid values are `ordered`, `free`. |
|  title | (ANY NAME) | (String) The title of the dashboard. |

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

resource "datadog_dashboard" "dashboard" {
  title         = ""
  description   = "Created using the Datadog provider in Terraform"
  layout_type   = ""
}
```

## Add SLO widget

1. Add blocks according to the following table.

*Note: "widget" block should be under the "resource" block!"*

|  key  |  value  | explanation |
| ---- | ---- | --- |
|  view_type  |  detail  | (String) The type of view to use when displaying the widget. Only `detail` is supported.|
|  slo_id  |  (SLO ID from Lab4)  |  (String) The ID of the service level objective used by the widget. |
|  show_error_budget  |  true  | (Boolean) Whether to show the error budget or not. |
| view_mode | overall | (String) The view mode for the widget. Valid values are `overall`, `component`, `both`. |
| time_windows | "7d" and "previous_week" | (List of String) A list of time windows to display in the widget. Valid values are `7d`, `30d`, `90d`, `week_to_date`, `previous_week`, `month_to_date`, `previous_month`, `global_time`. |

```
widget {
    service_level_objective_definition {
      title             = "SLO"
      view_type         = ""
      slo_id            = ""
      show_error_budget = 
      view_mode         = ""
      time_windows      = []
    }
  }
```

1. Initialize your configuration.

```
$ cd ../Lab5-Dashboard
$ terraform init
```

3. Apply your configuration to create a new synthetic monitor. Remember to confirm your apply with a `yes`.

```
$ terraform apply -var-file ../terraform.tfvars
```


4. Navigate to the [Dashboard list](https://app.datadoghq.com/dashboard/lists) to view your dashboard.

## Add Hostmap widget

Add Hostmap widget referring to [Datadog_dashboard(Resource)](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/dashboard)

<details>
<summary>Hint</summary>

```
widget {
    hostmap_definition {
      request {
        fill {
          q = "avg:system.load.1{*} by {host}"
        }
        size {
          q = "avg:memcache.uptime{*} by {host}"
        }
      }
      node_type       = "host"
      no_group_hosts  = true
      no_metric_hosts = true
      style {
        palette      = "yellow_to_green"
        palette_flip = true
        fill_min     = "10"
        fill_max     = "20"
      }
      title = "Host map"
    }
  }
```

</details>


## Add any widget you like！

Use the remaining time to add any widget your like to your dashboard.

## Clean up

shut down your EC2 host.

```
$ cd ../Lab1-EC2
$ terraform destroy -var-file ../terraform.tfvars
```

### Congratulations! That's all for the workshop!