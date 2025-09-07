## Global Var

variable "resource_group_name" {
  description = " (Required) The Name which should be used for this Resource Group."
  type        = string

}

variable "region" {
  description = "(Required) The Azure Region where the Resource Group should exist."
  type        = string

}

## Global Var


## Local Var


# IT Vnet
#---------------------------------------------------------------------------------------------------------------#
variable "it_vnet_name" {
  description = "(Required) The name of the virtual network."
  type        = string

}

variable "it_vnet_address_space" {
  description = "(Required) The address space that is used the virtual network."
  type        = list(any)
}

# Bastion Subnet
variable "it_bas_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "it_bas_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}

# IT Subnet
variable "it_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "it_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}
# IT Vnet
#---------------------------------------------------------------------------------------------------------------#


## Local Var