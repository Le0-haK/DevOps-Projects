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

  # IT Vnet #
  it_vnet_name          = var.it_vnet_name
  it_vnet_address_space = var.it_vnet_address_space
  # Bastion Subnet # 
  it_bas_sub_name             = var.it_bas_sub_name
  it_bas_sub_address_prefixes = var.it_bas_sub_address_prefixes
  # IT Subnet #
  it_sub_name             = var.it_sub_name
  it_sub_address_prefixes = var.it_sub_address_prefixes

  depends_on = [azurerm_resource_group.res_gp]

}

# Network Module
#---------------------------------------------------------------------------------------------------------------#


# Key Vault Module
#---------------------------------------------------------------------------------------------------------------#

module "kv" {
  source = "./keyvault"

  resource_group_name = var.resource_group_name
  region              = var.region
  current_tenant_id   = var.current_tenant_id

  # Other Modules Refer Var #
  # Network
  it_bas_sub_id = module.network.it_bas_sub_id
  it_sub_id     = module.network.it_sub_id
  it_vnet_id = module.network.it_vnet_id

  # Key Vault
  kv_name = var.kv_name
  kv_sku  = var.kv_sku

  depends_on = [module.network]

}


# Key Vault Module
#---------------------------------------------------------------------------------------------------------------#


# VM Module
#---------------------------------------------------------------------------------------------------------------#

module "virtual_machine" {
  source = "./vm"

  resource_group_name = var.resource_group_name
  region              = var.region

  # Other Modules Refer Var #
  # Network
  it_sub_id = module.network.it_sub_id
  # Key Vault
  vm1_username_from_kv   = module.kv.vm1_username_from_kv
  vm1_password_from_kv   = module.kv.vm1_password_from_kv
  vm2_username_from_kv   = module.kv.vm2_username_from_kv
  vm2_public_key_from_kv = module.kv.vm2_public_key_from_kv
  kv_dev_sudo_id         = module.kv.kv_dev_sudo_id # KV ID
  # Other Modules Refer Var #

  ## Local Reusable Var
  vm_linux_publisher = var.vm_linux_publisher
  vm_linux_offer     = var.vm_linux_offer
  vm_linux_sku       = var.vm_linux_sku
  vm_linux_latest    = var.vm_linux_latest
  ## Local Reusable Var

  # IT VM-1 #
  vm1_linux_it_nic_name      = var.vm1_linux_it_nic_name
  vm1_linux_it_ipconfig_name = var.vm1_linux_it_ipconfig_name
  vm1_linux_it_pip_allo      = var.vm1_linux_it_pip_allo
  vm1_linux_it_name          = var.vm1_linux_it_name
  vm1_linux_it_size          = var.vm1_linux_it_size
  vm1_linux_it_osdisk_name   = var.vm1_linux_it_osdisk_name
  vm1_linux_it_st_acc_type   = var.vm1_linux_it_st_acc_type
  # IT VM-1 #

  # IT VM-2 #
  vm2_linux_it_nic_name      = var.vm2_linux_it_nic_name
  vm2_linux_it_ipconfig_name = var.vm2_linux_it_ipconfig_name
  vm2_linux_it_pip_allo      = var.vm2_linux_it_pip_allo
  vm2_linux_it_name          = var.vm2_linux_it_name
  vm2_linux_it_size          = var.vm2_linux_it_size
  vm2_linux_it_osdisk_name   = var.vm2_linux_it_osdisk_name
  vm2_linux_it_st_acc_type   = var.vm2_linux_it_st_acc_type

  # IT VM-2 #

  depends_on = [module.kv]

}

# VM Module
#---------------------------------------------------------------------------------------------------------------#


# Bastion
#---------------------------------------------------------------------------------------------------------------#

module "bastion" {
  source = "./bastion"

  resource_group_name = var.resource_group_name
  region              = var.region

  # Other Modules Refer Var #
  # Network
  it_bas_sub_id = module.network.it_bas_sub_id
  # Other Modules Refer Var #

  # bastion Public IP
  bas_pubip_name = var.bas_pubip_name

  # bastion host
  bas_name          = var.bas_name
  bas_sku_type      = var.bas_sku_type
  bas_ipconfig_name = var.bas_ipconfig_name

  depends_on = [module.network]
}

# Bastion
#---------------------------------------------------------------------------------------------------------------#
