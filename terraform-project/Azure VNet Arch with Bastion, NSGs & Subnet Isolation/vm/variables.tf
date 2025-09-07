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

variable "hr_sub_id" {
  description = "Subnet ID where the NIC Attached to HR VM should connect to (Vnet1 Sub2)"
  type        = string

}

variable "it_sub_id" {
  description = "Subnet ID where the NIC Attached to IT VM should connect to (Vnet2 Sub1)"
  type        = string

}

variable "fin_sub_id" {
  description = "Subnet ID where the NIC Attached to Fin VM should connect to (Vnet3 Sub1)"
  type        = string

}

## Other Modules Refer Var 


## Local Reusable Var (Vars that're common in "vm" config - Defined them once and use everywhere (DRY))
variable "vm_linux_publisher" {
  description = "Linux VM Offer"
  type        = string


}

variable "vm_linux_offer" {
  description = "Linux VM Offer"
  type        = string


}

variable "vm_linux_sku" {
  description = "SKU type of the VM"
  type        = string


}

variable "vm_linux_latest" {
  description = "Version of the VM Image"
  type        = string


}

## Local Reusable Var


## Local Var (Vars unique in this "vm" config)


# HR VM
#---------------------------------------------------------------------------------------------------------------#

# HR VM NIC
variable "vm_linux_hr_nic_name" {
  description = "Name of the NIC"
  type        = string


}

variable "vm_linux_hr_ipconfig_name" {
  description = "Name of the VM Ip configuration"
  type        = string


}

variable "vm_linux_hr_pip_allo" {
  description = "Private IP Allocation type"
  type        = string

}

# HR VM
variable "vm_linux_hr_name" {
  description = "Name of the Linux VM"
  type        = string


}

variable "vm_linux_hr_size" {
  description = "Size/SKU of the VM"
  type        = string


}

variable "vm_linux_hr_osdisk_name" {
  description = "Name of the Linux OS Disk"
  type        = string



}

variable "vm_linux_hr_st_acc_type" {
  description = "Linux VM Storage Account type"
  type        = string


}

# HR VM
#---------------------------------------------------------------------------------------------------------------#

# IT VM
#---------------------------------------------------------------------------------------------------------------#

# IT VM NIC
variable "vm_linux_it_nic_name" {
  description = "Name of the NIC"
  type        = string


}

variable "vm_linux_it_ipconfig_name" {
  description = "Name of the VM Ip configuration"
  type        = string


}

variable "vm_linux_it_pip_allo" {
  description = "Private IP Allocation type"
  type        = string

}

# IT VM
variable "vm_linux_it_name" {
  description = "Name of the Linux VM"
  type        = string


}

variable "vm_linux_it_size" {
  description = "Size/SKU of the VM"
  type        = string


}

variable "vm_linux_it_osdisk_name" {
  description = "Name of the Linux OS Disk"
  type        = string



}

variable "vm_linux_it_st_acc_type" {
  description = "Linux VM Storage Account type"
  type        = string


}

# IT VM
#---------------------------------------------------------------------------------------------------------------#


# Finance VM
#---------------------------------------------------------------------------------------------------------------#

# Finance VM NIC
variable "vm_linux_fin_nic_name" {
  description = "Name of the NIC"
  type        = string


}

variable "vm_linux_fin_ipconfig_name" {
  description = "Name of the VM Ip configuration"
  type        = string


}

variable "vm_linux_fin_pip_allo" {
  description = "Private IP Allocation type"
  type        = string

}

# Finance VM
variable "vm_linux_fin_name" {
  description = "Name of the Linux VM"
  type        = string


}

variable "vm_linux_fin_size" {
  description = "Size/SKU of the VM"
  type        = string


}

variable "vm_linux_fin_osdisk_name" {
  description = "Name of the Linux OS Disk"
  type        = string



}

variable "vm_linux_fin_st_acc_type" {
  description = "Linux VM Storage Account type"
  type        = string


}

# Finance VM
#---------------------------------------------------------------------------------------------------------------#


## Local Var