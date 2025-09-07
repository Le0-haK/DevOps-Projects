# IT VM-1
#---------------------------------------------------------------------------------------------------------------#

output "vm1_linux_it_nic_id" {
  value = azurerm_network_interface.vm1_linux_it_nic.id

}

output "vm1_linux_it_nic_name" {
  value = azurerm_network_interface.vm1_linux_it_nic.name

}

output "vm1_linux_it_id" {
  value = azurerm_linux_virtual_machine.vm1_linux_it.id

}

output "vm1_linux_it_name" {
  value = azurerm_linux_virtual_machine.vm1_linux_it.name

}

output "vm1_linux_it_ipconfig_name" {
  value = azurerm_network_interface.vm1_linux_it_nic.ip_configuration[0].name

}

# IT VM-1
#---------------------------------------------------------------------------------------------------------------#


# IT VM-2
#---------------------------------------------------------------------------------------------------------------#

output "vm2_linux_it_nic_id" {
  value = azurerm_network_interface.vm2_linux_it_nic.id

}

output "vm2_linux_it_nic_name" {
  value = azurerm_network_interface.vm2_linux_it_nic.name

}

output "vm2_linux_it_id" {
  value = azurerm_linux_virtual_machine.vm2_linux_it.id

}

output "vm2_linux_it_name" {
  value = azurerm_linux_virtual_machine.vm2_linux_it.name

}

output "vm2_linux_it_ipconfig_name" {
  value = azurerm_network_interface.vm2_linux_it_nic.ip_configuration[0].name

}

# IT VM-2
#---------------------------------------------------------------------------------------------------------------#
