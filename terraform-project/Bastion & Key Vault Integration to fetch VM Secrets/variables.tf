## Global var (Vars that are defined in Project's Root main.tf)

# Resource Group
variable "resource_group_name" {
  description = " (Required) The Name which should be used for this Resource Group."
  type        = string

}

variable "region" {
  description = "(Required) The Azure Region where the Resource Group should exist."
  type        = string

}

variable "current_subscription_id" {
  description = "(Required) The Subscription ID which should be used. "
  type        = string
  sensitive   = true

}

variable "current_tenant_id" {
  description = "(Optional) The Tenant ID which should be used."
  type        = string
  sensitive   = true

}

## Global var


# Network Module
#---------------------------------------------------------------------------------------------------------------#

# IT Vnet
#--------------------------------------------------------------------#
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
#--------------------------------------------------------------------#

# Network Module
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

## Local Reusable Var (Vars that're common in "vm" config - Defined them once and use everywhere (DRY))

variable "vm_linux_publisher" {
  description = "(Required) Specifies the publisher of the image used to create the virtual machines. "
  type        = string

}

variable "vm_linux_offer" {
  description = "(Required) Specifies the offer of the image used to create the virtual machines."
  type        = string

}

variable "vm_linux_sku" {
  description = "(Required) Specifies the SKU of the image used to create the virtual machines."
  type        = string

}

variable "vm_linux_latest" {
  description = "(Required) Specifies the version of the image used to create the virtual machines."
  type        = string

}

## Local Reusable Var


## Local Var (Vars unique in this "vm" config)

# IT VM-1
#--------------------------------------------------------------------#

# IT VM-1 NIC
variable "vm1_linux_it_nic_name" {
  description = "(Required) The name of the Network Interface. "
  type        = string

}

variable "vm1_linux_it_ipconfig_name" {
  description = "(Required) A name used for this IP Configuration.n"
  type        = string

}

variable "vm1_linux_it_pip_allo" {
  description = "(Required) The allocation method used for the Private IP Address."
  type        = string

}

# IT VM-1
variable "vm1_linux_it_name" {
  description = "(Required) The name of the Linux Virtual Machine. "
  type        = string

}

variable "vm1_linux_it_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine"
  type        = string

}

variable "vm1_linux_it_osdisk_name" {
  description = "(Optional) The name which should be used for the Internal OS Disk. "
  type        = string

}

variable "vm1_linux_it_st_acc_type" {
  description = "(Required) The Type of Storage Account which should back this the Internal OS Disk. "
  type        = string

}

# IT VM-1
#--------------------------------------------------------------------#

# IT VM-2
#--------------------------------------------------------------------#

# IT VM-2 NIC
variable "vm2_linux_it_nic_name" {
  description = "(Required) The name of the Network Interface. "
  type        = string

}

variable "vm2_linux_it_ipconfig_name" {
  description = "(Required) A name used for this IP Configuration.n"
  type        = string

}

variable "vm2_linux_it_pip_allo" {
  description = "(Required) The allocation method used for the Private IP Address."
  type        = string

}

# IT VM-2
variable "vm2_linux_it_name" {
  description = "(Required) The name of the Linux Virtual Machine. "
  type        = string

}

variable "vm2_linux_it_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine"
  type        = string

}

variable "vm2_linux_it_osdisk_name" {
  description = "(Optional) The name which should be used for the Internal OS Disk. "
  type        = string

}

variable "vm2_linux_it_st_acc_type" {
  description = "(Required) The Type of Storage Account which should back this the Internal OS Disk. "
  type        = string

}

# IT VM-2
#--------------------------------------------------------------------#

## Local Var


# VM Module
#---------------------------------------------------------------------------------------------------------------#


# Bastion
#---------------------------------------------------------------------------------------------------------------#

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


# Bastion
#---------------------------------------------------------------------------------------------------------------#


# Key Vault
#---------------------------------------------------------------------------------------------------------------#

## Local Var

# Creating KV
variable "kv_name" {
  description = "(Required) Specifies the name of the Key Vault. "
  type        = string

}

variable "kv_sku" {
  description = "(Required) The Name of the SKU used for this Key Vault."
  type        = string

}

## Local Var


# Key Vault
#---------------------------------------------------------------------------------------------------------------#