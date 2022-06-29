terraform {
  required_providers {
    datadog = {
      source = "Datadog/datadog"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
