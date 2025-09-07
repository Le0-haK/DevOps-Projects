# Resource Group

resource "azurerm_resource_group" "res_gp" {
  name     = var.resource_group_name
  location = var.region

}

# Network Module
#---------------------------------------------------------------------------------------------------------------#

module "network" {
  source = "./network"

  resource_group_name = var.resource_group_name
  region              = var.region

  # HR Vnet #
  hr_vnet_name          = var.hr_vnet_name
  hr_vnet_address_space = var.hr_vnet_address_space
  # Bastion Subnet # 
  hr_bas_sub_name             = var.hr_bas_sub_name
  hr_bas_sub_address_prefixes = var.hr_bas_sub_address_prefixes
  # HR Subnet #
  hr_sub_name             = var.hr_sub_name
  hr_sub_address_prefixes = var.hr_sub_address_prefixes
  # NSG
  # Bastion Subnet NSG with Rules
  hr_bas_nsg_name     = var.hr_bas_nsg_name
  bas_nsg_rule01_name = var.bas_nsg_rule01_name
  bas_nsg_rule02_name = var.bas_nsg_rule02_name
  bas_nsg_rule03_name = var.bas_nsg_rule03_name
  bas_nsg_rule04_name = var.bas_nsg_rule04_name
  bas_nsg_rule05_name = var.bas_nsg_rule05_name
  bas_nsg_rule06_name = var.bas_nsg_rule06_name
  bas_nsg_rule07_name = var.bas_nsg_rule07_name
  bas_nsg_rule08_name = var.bas_nsg_rule08_name
  # HR Subnet NSG with Rules
  hr_nsg_name      = var.hr_nsg_name
  hr_nsg_rule_name = var.hr_nsg_rule_name
  # NSG
  # HR Vnet #

  # IT Vnet #
  it_vnet_name          = var.it_vnet_name
  it_vnet_address_space = var.it_vnet_address_space
  # IT Subnet
  it_sub_name             = var.it_sub_name
  it_sub_address_prefixes = var.it_sub_address_prefixes
  # NSG
  # IT Subnet NSG with Rules
  it_nsg_name      = var.it_nsg_name
  it_nsg_rule_name = var.it_nsg_rule_name
  # NSG
  # IT Vnet #

  # Finance Vnet
  fin_vnet_name          = var.fin_vnet_name
  fin_vnet_address_space = var.fin_vnet_address_space
  # Finance Subnet
  fin_sub_name             = var.fin_sub_name
  fin_sub_address_prefixes = var.fin_sub_address_prefixes
  # NSG
  fin_nsg_name      = var.fin_nsg_name
  fin_nsg_rule_name = var.fin_nsg_rule_name
  # NSG
  # Finance Vnet

  # Vnets Peering
  hr_vnet_to_it_vnet_peering_name  = var.hr_vnet_to_it_vnet_peering_name
  hr_vnet_to_fin_vnet_peering_name = var.hr_vnet_to_fin_vnet_peering_name
  it_vnet_to_hr_vnet_peering_name  = var.it_vnet_to_hr_vnet_peering_name
  it_vnet_to_fin_vnet_peering_name = var.it_vnet_to_fin_vnet_peering_name
  fin_vnet_to_hr_vnet_peering_name = var.fin_vnet_to_hr_vnet_peering_name
  fin_vnet_to_it_vnet_peering_name = var.fin_vnet_to_it_vnet_peering_name

  depends_on = [azurerm_resource_group.res_gp]
}



# Network Module
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

module "virtual_machine" {
  source = "./vm"

  resource_group_name = var.resource_group_name
  region              = var.region

  # Other Modules Refer Var #
  # Network
  hr_sub_id  = module.network.hr_sub_id
  it_sub_id  = module.network.it_sub_id
  fin_sub_id = module.network.fin_sub_id
  # Other Modules Refer Var #

  ## Local Reusable Var
  vm_linux_publisher = var.vm_linux_publisher
  vm_linux_offer     = var.vm_linux_offer
  vm_linux_sku       = var.vm_linux_sku
  vm_linux_latest    = var.vm_linux_latest
  ## Local Reusable Var

  # HR VM #
  vm_linux_hr_nic_name      = var.vm_linux_hr_nic_name
  vm_linux_hr_ipconfig_name = var.vm_linux_hr_ipconfig_name
  vm_linux_hr_pip_allo      = var.vm_linux_hr_pip_allo
  vm_linux_hr_name          = var.vm_linux_hr_name
  vm_linux_hr_size          = var.vm_linux_hr_size
  vm_linux_hr_osdisk_name   = var.vm_linux_hr_osdisk_name
  vm_linux_hr_st_acc_type   = var.vm_linux_hr_st_acc_type
  # HR VM #

  # IT VM #
  vm_linux_it_nic_name      = var.vm_linux_it_nic_name
  vm_linux_it_ipconfig_name = var.vm_linux_it_ipconfig_name
  vm_linux_it_pip_allo      = var.vm_linux_it_pip_allo
  vm_linux_it_name          = var.vm_linux_it_name
  vm_linux_it_size          = var.vm_linux_it_size
  vm_linux_it_osdisk_name   = var.vm_linux_it_osdisk_name
  vm_linux_it_st_acc_type   = var.vm_linux_it_st_acc_type
  # IT VM #

  # Fin VM #
  vm_linux_fin_nic_name      = var.vm_linux_fin_nic_name
  vm_linux_fin_ipconfig_name = var.vm_linux_fin_ipconfig_name
  vm_linux_fin_pip_allo      = var.vm_linux_fin_pip_allo
  vm_linux_fin_name          = var.vm_linux_fin_name
  vm_linux_fin_size          = var.vm_linux_fin_size
  vm_linux_fin_osdisk_name   = var.vm_linux_fin_osdisk_name
  vm_linux_fin_st_acc_type   = var.vm_linux_fin_st_acc_type
  # Fin VM #

  depends_on = [module.network]
}

# VM Module
#---------------------------------------------------------------------------------------------------------------#


# Bastion Module
#---------------------------------------------------------------------------------------------------------------#

module "bastion" {
  source = "./bastion"

  resource_group_name = var.resource_group_name
  region              = var.region

  # bastion Public IP
  bas_pubip_name = var.bas_pubip_name

  # bastion host
  bas_name          = var.bas_name
  bas_sku_type      = var.bas_sku_type
  bas_ipconfig_name = var.bas_ipconfig_name
  hr_bas_sub_id     = module.network.hr_bas_sub_id

  depends_on = [module.network]

}

# Bastion Module
#---------------------------------------------------------------------------------------------------------------#