# Bastion
#---------------------------------------------------------------------------------------------------------------#

# Creating bastion Public IP
resource "azurerm_public_ip" "bas_pubip" {
  name                = var.bas_pubip_name
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Creating bastion host
resource "azurerm_bastion_host" "bastionhost" {
  name                = var.bas_name
  resource_group_name = var.resource_group_name
  location            = var.region
  sku                 = var.bas_sku_type

  ip_configuration {
    name                 = var.bas_ipconfig_name
    subnet_id            = var.hr_bas_sub_id # module.network.hr_bas_sub_id
    public_ip_address_id = azurerm_public_ip.bas_pubip.id

  }

}

# Bastion
#---------------------------------------------------------------------------------------------------------------#