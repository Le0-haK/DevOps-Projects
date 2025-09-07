# IT Vnet
#---------------------------------------------------------------------------------------------------------------#
output "it_vnet_id" {
  value = azurerm_virtual_network.it_vnet.id

}

output "it_vnet_name" {
  value = azurerm_virtual_network.it_vnet.name

}

# Bastion Subnet
output "it_bas_sub_id" {
  value = azurerm_subnet.it_bas_sub.id

}

output "it_bas_sub_name" {
  value = azurerm_subnet.it_bas_sub.name

}

# IT Subnet
output "it_sub_id" {
  value = azurerm_subnet.it_sub.id

}

output "it_sub_name" {
  value = azurerm_subnet.it_sub.name

}

# IT Vnet
#---------------------------------------------------------------------------------------------------------------#