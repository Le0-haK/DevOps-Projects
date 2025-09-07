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

variable "it_bas_sub_id" {
  description = "Subnet ID where this bastion NIC should connect to (Vnet1 Sub1)"
  type        = string

}

## Other Modules Refer Var 


## Local Var (Vars unique in this "bastion" config)

# bastion Public IP
variable "bas_pubip_name" {
  description = "(Required) Specifies the name of the Public IP."
  type        = string


}

# bastion host
variable "bas_name" {
  description = "(Required) Specifies the name of the Bastion."
  type        = string


}

variable "bas_sku_type" {
  description = "(Optional) The SKU tier of this Bastion"
  type        = string


}

variable "bas_ipconfig_name" {
  description = "(Required) Specifies the name of the frontend IP configuration."
  type        = string


}

## Local Var