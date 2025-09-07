# HR Vnet
#---------------------------------------------------------------------------------------------------------------#
output "hr_vnet_id" {
  value = azurerm_virtual_network.hr_vnet.id

}

output "hr_vnet_name" {
  value = azurerm_virtual_network.hr_vnet.name

}

# Bastion Subnet
output "hr_bas_sub_id" {
  value = azurerm_subnet.hr_bas_sub.id

}

output "hr_bas_sub_name" {
  value = azurerm_subnet.hr_bas_sub.name

}

# HR Subnet
output "hr_sub_id" {
  value = azurerm_subnet.hr_sub.id

}

output "hr_sub_name" {
  value = azurerm_subnet.hr_sub.name

}

# HR Vnet
#---------------------------------------------------------------------------------------------------------------#


# IT Vnet
#---------------------------------------------------------------------------------------------------------------#

output "it_vnet_id" {
  value = azurerm_virtual_network.it_vnet.id

}

output "it_vnet_name" {
  value = azurerm_virtual_network.it_vnet.name

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


# Finance Vnet
#---------------------------------------------------------------------------------------------------------------#
output "fin_vnet_id" {
  value = azurerm_virtual_network.fin_vnet.id

}

output "fin_vnet_name" {
  value = azurerm_virtual_network.fin_vnet.name

}

# Finance Subnet
output "fin_sub_id" {
  value = azurerm_subnet.fin_sub.id

}

output "fin_sub_name" {
  value = azurerm_subnet.fin_sub.name

}

# Finance Vnet
#---------------------------------------------------------------------------------------------------------------#