# HR VM
#---------------------------------------------------------------------------------------------------------------#

# Creating HR VM NIC
resource "azurerm_network_interface" "vm_linux_hr_nic" {
  name                = var.vm_linux_hr_nic_name
  resource_group_name = var.resource_group_name
  location            = var.region

  ip_configuration {
    name                          = var.vm_linux_hr_ipconfig_name
    subnet_id                     = var.hr_sub_id // module.network.hr_sub_id 
    private_ip_address_allocation = var.vm_linux_hr_pip_allo
  }
}

# Creating HR VM

resource "azurerm_linux_virtual_machine" "vm_linux_hr" {
  name                = var.vm_linux_hr_name
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm_linux_hr_size

  network_interface_ids = [
    azurerm_network_interface.vm_linux_hr_nic.id,
  ]
  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("<path-to-your-public-key>")
  }

  os_disk {
    name                 = var.vm_linux_hr_osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm_linux_hr_st_acc_type
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_latest
  }

  priority        = "Spot"
  eviction_policy = "Delete"

}

# HR VM
#---------------------------------------------------------------------------------------------------------------#


# IT VM
#---------------------------------------------------------------------------------------------------------------#

# Creating IT VM NIC
resource "azurerm_network_interface" "vm_linux_it_nic" {
  name                = var.vm_linux_it_name
  resource_group_name = var.resource_group_name
  location            = var.region

  ip_configuration {
    name                          = var.vm_linux_it_ipconfig_name
    subnet_id                     = var.it_sub_id // module.network.it_sub_id 
    private_ip_address_allocation = var.vm_linux_it_pip_allo
  }
}

# Creating IT VM

resource "azurerm_linux_virtual_machine" "vm_linux_it" {
  name                = var.vm_linux_it_name
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm_linux_it_size

  network_interface_ids = [
    azurerm_network_interface.vm_linux_it_nic.id,
  ]
  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("<path-to-your-public-key>")
  }

  os_disk {
    name                 = var.vm_linux_it_osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm_linux_it_st_acc_type
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_latest
  }

  priority        = "Spot"
  eviction_policy = "Delete"

}

# IT VM
#---------------------------------------------------------------------------------------------------------------#


# Finance VM
#---------------------------------------------------------------------------------------------------------------#

# Creating Finance VM NIC
resource "azurerm_network_interface" "vm_linux_fin_nic" {
  name                = var.vm_linux_fin_name
  resource_group_name = var.resource_group_name
  location            = var.region

  ip_configuration {
    name                          = var.vm_linux_fin_ipconfig_name
    subnet_id                     = var.fin_sub_id // module.network.fin_sub_id 
    private_ip_address_allocation = var.vm_linux_fin_pip_allo
  }
}

# Creating Finance VM

resource "azurerm_linux_virtual_machine" "vm_linux_fin" {
  name                = var.vm_linux_fin_name
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm_linux_fin_size

  network_interface_ids = [
    azurerm_network_interface.vm_linux_fin_nic.id,
  ]
  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("<path-to-your-public-key>")
  }

  os_disk {
    name                 = var.vm_linux_fin_osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm_linux_fin_st_acc_type
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_latest
  }

  priority        = "Spot"
  eviction_policy = "Delete"

}

# Finance VM
#---------------------------------------------------------------------------------------------------------------#