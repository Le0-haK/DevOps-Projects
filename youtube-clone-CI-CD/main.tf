## Common Variables ##
locals {
  tags = {
    Environment = "${var.environment}",
    Project     = "${var.project}"
    CreatedBy   = "Terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.region
  tags     = local.tags
}

variable "environment" {
  type        = string
  description = "Specifies the Name of an Environment"
}

variable "project" {
  type        = string
  description = "(Required) Name of the project, it will be included in tags"
}

variable "subscription_id" {
   type        = string
   description = "(Required) Name of the Subscription where the project reside"
}

variable "region" {
  type        = string
  description = "(Required) Specifies the location/region where the vnets will be created"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the Name for the Resource Group."
}

## Common Variables ##

# Calling AS
module "App_Service" {
  source = "./app-service"

  resource_group_name = var.resource_group_name
  region              = var.region
  as_plan_name        = var.as_plan_name
  as_os_type          = var.as_os_type
  as_sku              = var.as_sku
  as_name             = var.as_name
  node_version        = var.node_version

  tags = local.tags

}