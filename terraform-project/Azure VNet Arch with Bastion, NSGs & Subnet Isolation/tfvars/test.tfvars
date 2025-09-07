## Global var

resource_group_name = "SUDO-company-Infra"
region              = "UAE North"

## Global var

# Network Module
#---------------------------------------------------------------------------------------------------------------#

# HR Vnet #
hr_vnet_name          = "hr-vnet-uaen-01"
hr_vnet_address_space = ["10.10.0.0/24"] # 0 - 255 range
# Bastion Subnet # 
hr_bas_sub_name             = "AzureBastionSubnet"
hr_bas_sub_address_prefixes = ["10.10.0.0/26"] # # 0 - 63 
# HR Subnet #
hr_sub_name             = "hr-snet-uaen-01"
hr_sub_address_prefixes = ["10.10.0.64/26"] # # 64 - 127
# NSG
# Bastion Subnet NSG with Rules
hr_bas_nsg_name     = "bas-snet-nsg-uaen-01"
bas_nsg_rule01_name = "allow_https_in"
bas_nsg_rule02_name = "allow_gatewaymanager_in"
bas_nsg_rule03_name = "allow_internal_in"
bas_nsg_rule04_name = "allow_azure_lb_in"
bas_nsg_rule05_name = "allow_rdp_ssh_out"
bas_nsg_rule06_name = "allow_internal_out"
bas_nsg_rule07_name = "allow_azure_services_out"
bas_nsg_rule08_name = "allow_internet_out"
# HR Subnet NSG with Rules
hr_nsg_name      = "hr-snet-nsg-uaen-02"
hr_nsg_rule_name = "Deny_ssh_in"
# NSG
# HR Vnet #

# IT Vnet #
it_vnet_name          = "it-vnet-uaen-02"
it_vnet_address_space = ["20.20.0.0/24"] # 0 - 255 range
# IT Subnet
it_sub_name             = "it-snet-uaen-01"
it_sub_address_prefixes = ["20.20.0.0/26"] # 0 - 63 range
# NSG
# IT Subnet NSG with Rules
it_nsg_name      = "it-snet-nsg-uaen-01"
it_nsg_rule_name = "Allow_ssh_in"
# NSG
# IT Vnet #

# Finance Vnet
fin_vnet_name          = "fin-vnet-uaen-03"
fin_vnet_address_space = ["30.30.0.0/24"] # 0 - 255 range
# Finance Subnet
fin_sub_name             = "fin-snet-uaen-01"
fin_sub_address_prefixes = ["30.30.0.0/26"] # 0 - 64 range
# NSG
fin_nsg_name      = "fin-snet-nsg-uaen-01"
fin_nsg_rule_name = "Allow_ssh_in"
# NSG
# Finance Vnet

# Vnets Peering
hr_vnet_to_it_vnet_peering_name  = "hr_vnet_to_it_vnet_peering"
hr_vnet_to_fin_vnet_peering_name = "hr_vnet_to_fin_vnet_peering"
it_vnet_to_hr_vnet_peering_name  = "it_vnet_to_hr_vnet_peering"
it_vnet_to_fin_vnet_peering_name = "it_vnet_to_fin_vnet_peering"
fin_vnet_to_hr_vnet_peering_name = "fin_vnet_to_hr_vnet_peering"
fin_vnet_to_it_vnet_peering_name = "fin_vnet_to_it_vnet_peering"


# Network Module
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

## Local Reusable Var
vm_linux_publisher = "Canonical"
vm_linux_offer     = "UbuntuServer"
vm_linux_sku       = "16.04-lts"
vm_linux_latest    = "latest"
## Local Reusable Var


# HR VM NIC
vm_linux_hr_nic_name      = "vm-linux-hr-nic"
vm_linux_hr_ipconfig_name = "vm_linux_hr_ipconfig"
vm_linux_hr_pip_allo      = "Dynamic"

# HR VM
vm_linux_hr_name        = "vm-linux-hr-uaen-01"
vm_linux_hr_size        = "Standard_DS1_v2"
vm_linux_hr_osdisk_name = "vm_linux_hr_osdisk"
vm_linux_hr_st_acc_type = "Standard_LRS"


# IT VM NIC
vm_linux_it_nic_name      = "vm-linux-it-nic"
vm_linux_it_ipconfig_name = "vm_linux_it_ipconfig"
vm_linux_it_pip_allo      = "Dynamic"

# IT VM
vm_linux_it_name        = "vm-linux-it-uaen-01"
vm_linux_it_size        = "Standard_DS1_v2"
vm_linux_it_osdisk_name = "vm_linux_it_osdisk"
vm_linux_it_st_acc_type = "Standard_LRS"


# Finance VM NIC
vm_linux_fin_nic_name      = "vm-linux-fin-nic"
vm_linux_fin_ipconfig_name = "vm_linux_fin_ipconfig"
vm_linux_fin_pip_allo      = "Dynamic"

# Finance VM
vm_linux_fin_name        = "vm-linux-fin-uaen-01"
vm_linux_fin_size        = "Standard_DS1_v2"
vm_linux_fin_osdisk_name = "vm_linux_fin_osdisk"
vm_linux_fin_st_acc_type = "Standard_LRS"


# VM Module
#---------------------------------------------------------------------------------------------------------------#

# Bastion Module
#---------------------------------------------------------------------------------------------------------------#
bas_pubip_name    = "bastion_publicip"
bas_name          = "bastion_uaen-01"
bas_sku_type      = "Basic"
bas_ipconfig_name = "bastion_ipconfig"



# Bastion Module
#---------------------------------------------------------------------------------------------------------------#