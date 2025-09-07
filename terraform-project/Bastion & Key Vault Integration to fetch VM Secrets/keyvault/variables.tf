## Global Var

variable "resource_group_name" {
  description = " (Required) The Name which should be used for this Resource Group."
  type        = string

}

variable "region" {
  description = "(Required) The Azure Region where the Resource Group should exist."
  type        = string

}

variable "current_tenant_id" {
  description = "(Optional) The Tenant ID which should be used."
  type        = string
  sensitive   = true

}

## Global Var


# Other Modules Refer Var (local Vars that're dependent on other Module's Vars)

# Network

variable "it_sub_id" {
  description = "Subnet ID of IT Subnet"
  type        = string

}

variable "it_bas_sub_id" {
  description = "Subnet ID of Bastion Subnet"
  type        = string

}

variable "it_vnet_id" {
  description = "ID of the IT VNet"
  type = string
  
}

## Other Modules Refer Var 


## Local Var

# Creating Key Vault
variable "kv_name" {
  description = "(Required) Specifies the name of the Key Vault. "
  type        = string

}

variable "kv_sku" {
  description = "(Required) The Name of the SKU used for this Key Vault."
  type        = string

}

## Local Var

