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


# HR Vnet
#---------------------------------------------------------------------------------------------------------------#
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
#---------------------------------------------------------------------------------------------------------------#


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
#---------------------------------------------------------------------------------------------------------------#


# Finance Vnet
#---------------------------------------------------------------------------------------------------------------#

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
#---------------------------------------------------------------------------------------------------------------#

# Vnets Peering
#---------------------------------------------------------------------------------------------------------------#

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
  default     = "fin_vnet_to_it_vnet_peering"

}

# Vnets Peering
#---------------------------------------------------------------------------------------------------------------#




## Local Var