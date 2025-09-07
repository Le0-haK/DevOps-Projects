## Global var

resource_group_name = "SUDO-company-Infra"
region              = "UAE North"

## Global var


# Network Module
#---------------------------------------------------------------------------------------------------------------#

# IT Vnet #
it_vnet_name          = "it-vnet-uaen-01"
it_vnet_address_space = ["10.10.0.0/24"] # 0 - 255 range
# Bastion Subnet # 
it_bas_sub_name             = "AzureBastionSubnet"
it_bas_sub_address_prefixes = ["10.10.0.0/26"] # 0 - 63 
# IT WEB Subnet #
it_sub_name             = "it-snet-uaen"
it_sub_address_prefixes = ["10.10.0.64/26"] # 64 - 127

# Network Module
#---------------------------------------------------------------------------------------------------------------#


# Key Vault
#---------------------------------------------------------------------------------------------------------------#

# Creating KV
kv_name = "kv-dev-uaen-sudo-01"
kv_sku  = "standard"


# Key Vault
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

## Local Reusable Var
vm_linux_publisher = "Canonical"
vm_linux_offer     = "UbuntuServer"
vm_linux_sku       = "16.04-lts"
vm_linux_latest    = "latest"
## Local Reusable Var


# IT VM-1 NIC
vm1_linux_it_nic_name      = "vm1-linux-it-nic"
vm1_linux_it_ipconfig_name = "vm1_linux_it_ipconfig"
vm1_linux_it_pip_allo      = "Dynamic"

# IT VM-1
vm1_linux_it_name        = "vm1-linux-it-uaen-01"
vm1_linux_it_size        = "Standard_DS1_v2"
vm1_linux_it_osdisk_name = "vm1_linux_it_osdisk"
vm1_linux_it_st_acc_type = "Standard_LRS"


# IT VM-2 NIC
vm2_linux_it_nic_name      = "vm2-linux-it-nic"
vm2_linux_it_ipconfig_name = "vm2_linux_it_ipconfig"
vm2_linux_it_pip_allo      = "Dynamic"

# IT VM-2
vm2_linux_it_name        = "vm2-linux-it-uaen-02"
vm2_linux_it_size        = "Standard_DS1_v2"
vm2_linux_it_osdisk_name = "vm2_linux_it_osdisk"
vm2_linux_it_st_acc_type = "Standard_LRS"


# VM Module
#---------------------------------------------------------------------------------------------------------------#

# Bastion
#---------------------------------------------------------------------------------------------------------------#

# bastion Public IP
bas_pubip_name = "bastion_publicip"

# bastion host
bas_name          = "bastion_uaen-01"
bas_sku_type      = "Basic"
bas_ipconfig_name = "bastion_ipconfig"

# Bastion
#---------------------------------------------------------------------------------------------------------------#

