# IT Vnet
#---------------------------------------------------------------------------------------------------------------#

# Creating IT Vnet                  

resource "azurerm_virtual_network" "it_vnet" {
  name                = var.it_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.it_vnet_address_space

}

# Bastion Subnet

resource "azurerm_subnet" "it_bas_sub" {
  name                 = var.it_bas_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.it_vnet.name
  address_prefixes     = var.it_bas_sub_address_prefixes
  service_endpoints    = ["Microsoft.KeyVault"]

}

# IT Subnet

resource "azurerm_subnet" "it_sub" {
  name                 = var.it_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.it_vnet.name
  address_prefixes     = var.it_sub_address_prefixes
  service_endpoints    = ["Microsoft.KeyVault"]

}

# IT Vnet
#---------------------------------------------------------------------------------------------------------------#