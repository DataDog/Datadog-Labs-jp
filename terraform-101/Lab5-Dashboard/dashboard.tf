terraform {
  required_providers {
    datadog = {
      source = "Datadog/datadog"
    }
  }
}

variable "datadog_api_key" {}
variable "datadog_app_key" {}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
