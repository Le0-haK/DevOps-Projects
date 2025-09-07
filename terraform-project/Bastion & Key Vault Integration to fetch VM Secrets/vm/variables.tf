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


# Other Modules Refer Var (local Vars that're dependent on other Module's Vars)

# Network
variable "it_sub_id" {
  description = "Subnet ID of IT Subnet"
  type        = string

}

# Key Vault
variable "vm1_username_from_kv" {
  description = "(Required) The username of the local administrator used for the Virtual Machine."
  type        = string
  sensitive   = true

}

variable "vm1_password_from_kv" {
  description = "(Optional) The Password which should be used for the local-administrator on this Virtual Machine."
  type        = string
  sensitive   = true

}

variable "vm2_username_from_kv" {
  description = "(Required) The username of the local administrator used for the Virtual Machine."
  type        = string
  sensitive   = true

}

variable "vm2_public_key_from_kv" {
  description = "(Optional) The Public Key which should be used for the local-administrator on this Virtual Machine."
  type        = string
  sensitive   = true

}

variable "kv_dev_sudo_id" {
  description = "ID of the Key Vault"
  type        = string

}


# Other Modules Refer Var


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
#---------------------------------------------------------------------------------------------------------------#

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
#---------------------------------------------------------------------------------------------------------------#

# IT VM-2
#---------------------------------------------------------------------------------------------------------------#

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
#---------------------------------------------------------------------------------------------------------------#


## Local Var