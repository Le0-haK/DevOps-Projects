terraform {
  backend "azurerm" {
    resource_group_name  = "VQ-AI-Service"
    storage_account_name = "staccbackend"
    container_name       = "blobtf"
    key                 = "terraform.tfstate"  # This acts as the unique name for the state file
    subscription_id = "bbxxxxxe-e20d-4x26-9x09-1xxxxd"
  }

  required_providers { 
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
   resource_group {
      prevent_deletion_if_contains_resources = true 
   }
  }
}