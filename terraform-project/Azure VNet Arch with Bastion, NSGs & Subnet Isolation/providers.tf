terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.current_subscription_id
  tenant_id       = var.current_tenant_id
  features {}
}
