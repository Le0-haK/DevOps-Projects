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
  sensitive = true

}

variable "current_tenant_id" {
  description = "(Optional) The Tenant ID which should be used."
  type        = string
  sensitive = true

}

## Global var


# Network Module
#---------------------------------------------------------------------------------------------------------------#

# HR Vnet
#--------------------------------------------------------------------#
variable "hr_vnet_name" {
  description = "(Required) The name of the virtual network."
  type        = string

}

variable "hr_vnet_address_space" {
  description = "(Required) The address space that is used the virtual network."
  type        = list(any)
}

# Bastion Subnet
variable "hr_bas_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "hr_bas_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}

# HR Subnet
variable "hr_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "hr_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}

# NSG

# Bastion Subnet NSG with Rules

variable "hr_bas_nsg_name" {
  description = "(Required) Specifies the name of the network security group."
  type        = string

}

variable "bas_nsg_rule01_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule02_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule03_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule04_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule05_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule06_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule07_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

variable "bas_nsg_rule08_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string


}

# HR Subnet NSG with Rules
variable "hr_nsg_name" {
  description = "(Required) Specifies the name of the network security group."
  type        = string

}

variable "hr_nsg_rule_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string

}

# NSG

# HR Vnet
#--------------------------------------------------------------------#


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

# IT Subnet
variable "it_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "it_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}

# NSG

# IT Subnet NSG with Rules
variable "it_nsg_name" {
  description = "(Required) Specifies the name of the network security group."
  type        = string

}

variable "it_nsg_rule_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string

}

# NSG

# IT Vnet
#--------------------------------------------------------------------#


# Finance Vnet
#--------------------------------------------------------------------#

variable "fin_vnet_name" {
  description = "(Required) The name of the virtual network."
  type        = string

}

variable "fin_vnet_address_space" {
  description = "(Required) The address space that is used the virtual network."
  type        = list(any)
}

# Finance Subnet
variable "fin_sub_name" {
  description = "(Required) The name of the subnet."
  type        = string
}

variable "fin_sub_address_prefixes" {
  description = "(Required) The address prefixes for the subnet"
  type        = list(any)
}

# NSG

# Finance Subnet NSG with Rules
variable "fin_nsg_name" {
  description = "(Required) Specifies the name of the network security group."
  type        = string

}

variable "fin_nsg_rule_name" {
  description = "(Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group."
  type        = string

}

# Finance Vnet
#--------------------------------------------------------------------#

# Vnets Peering
#--------------------------------------------------------------------#

variable "hr_vnet_to_it_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

variable "hr_vnet_to_fin_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

variable "it_vnet_to_hr_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

variable "it_vnet_to_fin_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

variable "fin_vnet_to_hr_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

variable "fin_vnet_to_it_vnet_peering_name" {
  description = "(Required) The name of the virtual network peering. Changing this forces a new resource to be created."
  type        = string


}

# Vnets Peering
#--------------------------------------------------------------------#


# Network Module
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

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

# HR VM
#--------------------------------------------------------------------#

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
#--------------------------------------------------------------------#


# IT VM
#--------------------------------------------------------------------#

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
#--------------------------------------------------------------------#


# Finance VM
#--------------------------------------------------------------------#

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
#--------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#


# Bastion Module
#---------------------------------------------------------------------------------------------------------------#

# bastion Public IP
variable "bas_pubip_name" {
  description = "Name of the Public IP of Bastion"
  type        = string
  # default = "Bas_pubip"

}

# bastion host
variable "bas_name" {
  description = "Name of the Bastion Host"
  type        = string
  # default = "Bastion-dev-eus-infra-01"

}

variable "bas_sku_type" {
  description = "SKU type of the bastion"
  type        = string
  # default = "Basic"

}

variable "bas_ipconfig_name" {
  description = "Name of the Bastion IP configuration"
  type        = string
  # default = "bastion-ipconfig"

}

# Bastion Module
#---------------------------------------------------------------------------------------------------------------#