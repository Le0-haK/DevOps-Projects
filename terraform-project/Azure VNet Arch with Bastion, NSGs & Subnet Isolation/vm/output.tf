# HR VM
#---------------------------------------------------------------------------------------------------------------#

output "vm_linux_hr_nic_id" {
  value = azurerm_network_interface.vm_linux_hr_nic.id

}

output "vm_linux_hr_nic_name" {
  value = azurerm_network_interface.vm_linux_hr_nic.name

}

output "vm_linux_hr_id" {
  value = azurerm_linux_virtual_machine.vm_linux_hr.id

}

output "vm_linux_hr_name" {
  value = azurerm_linux_virtual_machine.vm_linux_hr.name

}

# HR VM
#---------------------------------------------------------------------------------------------------------------#

# IT VM
#---------------------------------------------------------------------------------------------------------------#


output "vm_linux_it_nic_id" {
  value = azurerm_network_interface.vm_linux_it_nic.id

}

output "vm_linux_it_nic_name" {
  value = azurerm_network_interface.vm_linux_it_nic.name

}

output "vm_linux_it_id" {
  value = azurerm_linux_virtual_machine.vm_linux_it.id

}

output "vm_linux_it_name" {
  value = azurerm_linux_virtual_machine.vm_linux_it.name

}


# IT VM
#---------------------------------------------------------------------------------------------------------------#

# Finance VM
#---------------------------------------------------------------------------------------------------------------#

output "vm_linux_fin_nic_id" {
  value = azurerm_network_interface.vm_linux_fin_nic.id

}

output "vm_linux_fin_nic_name" {
  value = azurerm_network_interface.vm_linux_fin_nic.name

}

output "vm_linux_fin_id" {
  value = azurerm_linux_virtual_machine.vm_linux_fin.id

}

output "vm_linux_fin_name" {
  value = azurerm_linux_virtual_machine.vm_linux_fin.name

}

# Finance VM
#---------------------------------------------------------------------------------------------------------------#