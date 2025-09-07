## Global Var (Vars that are defined in Project's Root main.tf)

variable "resource_group_name" {
  description = " (Required) The Name which should be used for this Resource Group."
  type        = string

}

variable "region" {
  description = "(Required) The Azure Region where the Resource Group should exist."
  type        = string

}

## Global Var

## Other Modules Refer Var (local Vars that're dependent on other Module's Vars)

# Network

variable "hr_bas_sub_id" {
  description = "Subnet ID where this bastion NIC should connect to (Vnet1 Sub1)"
  type        = string

}

## Other Modules Refer Var 


## Local Var (Vars unique in this "bastion" config)

# bastion Public IP
variable "bas_pubip_name" {
  description = "Name of the Public IP of Bastion"
  type        = string
  

}

# bastion host
variable "bas_name" {
  description = "Name of the Bastion Host"
  type        = string
  

}

variable "bas_sku_type" {
  description = "SKU type of the bastion"
  type        = string
  

}

variable "bas_ipconfig_name" {
  description = "Name of the Bastion IP configuration"
  type        = string
  

}

## Local Var