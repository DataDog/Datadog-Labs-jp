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

resource "datadog_synthetics_test" "api-test" {
  name      = "terraform API test"
  type      = ""
  subtype   = ""
  locations = [""]

  request_definition {
    method = ""
    url    = ""
  }

  message = "Error occured!"

  status = ""
}