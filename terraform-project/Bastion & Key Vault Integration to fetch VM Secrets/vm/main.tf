# IT VM-1
#---------------------------------------------------------------------------------------------------------------#

# Creating IT VM-1 NIC
resource "azurerm_network_interface" "vm1_linux_it_nic" {
  name                = var.vm1_linux_it_nic_name
  resource_group_name = var.resource_group_name
  location            = var.region

  ip_configuration {
    name                          = var.vm1_linux_it_ipconfig_name
    subnet_id                     = var.it_sub_id // module.network.it_sub_id 
    private_ip_address_allocation = var.vm1_linux_it_pip_allo
  }
}

# Creating IT VM-1

resource "azurerm_linux_virtual_machine" "vm1_linux_it" {
  name                = var.vm1_linux_it_name
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm1_linux_it_size
  admin_username      = var.vm1_username_from_kv // fetch this from KV
  admin_password      = var.vm1_password_from_kv // fetch this from KV

  network_interface_ids = [
    azurerm_network_interface.vm1_linux_it_nic.id,
  ]

  os_disk {
    name                 = var.vm1_linux_it_osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm1_linux_it_st_acc_type
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_latest
  }

  priority                        = "Spot"
  eviction_policy                 = "Delete"
  disable_password_authentication = false

  # Enable System-Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

}

# Assign Role to SAMI of IT VM-1
resource "azurerm_role_assignment" "vm1_kv_secrets_user" {
  principal_id         = azurerm_linux_virtual_machine.vm1_linux_it.identity[0].principal_id
  role_definition_name = "Key Vault Administrator"
  scope                = var.kv_dev_sudo_id # KV ID 
}

resource "azurerm_role_assignment" "vm1_kv_secrets_user_read" {
  principal_id         = azurerm_linux_virtual_machine.vm1_linux_it.identity[0].principal_id
  role_definition_name = "Key Vault Reader"
  scope                = var.kv_dev_sudo_id # KV ID 
}


# IT VM-1
#---------------------------------------------------------------------------------------------------------------#


# IT VM-2
#---------------------------------------------------------------------------------------------------------------#

# Creating IT VM-2 NIC
resource "azurerm_network_interface" "vm2_linux_it_nic" {
  name                = var.vm2_linux_it_nic_name
  resource_group_name = var.resource_group_name
  location            = var.region

  ip_configuration {
    name                          = var.vm2_linux_it_ipconfig_name
    subnet_id                     = var.it_sub_id // module.network.it_sub_id 
    private_ip_address_allocation = var.vm2_linux_it_pip_allo
  }
}

# Creating IT VM-2

resource "azurerm_linux_virtual_machine" "vm2_linux_it" {
  name                = var.vm2_linux_it_name
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm2_linux_it_size
  admin_username      = var.vm2_username_from_kv // fetch this from KV

  admin_ssh_key {
    username   = var.vm2_username_from_kv   // fetch this from KV
    public_key = var.vm2_public_key_from_kv // fetch this from KV
  }

  network_interface_ids = [
    azurerm_network_interface.vm2_linux_it_nic.id,
  ]


  os_disk {
    name                 = var.vm2_linux_it_osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm2_linux_it_st_acc_type
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_latest
  }

  priority        = "Spot"
  eviction_policy = "Delete"

  # Enable System-Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

}

# Assign Role to SAMI of IT VM-1
resource "azurerm_role_assignment" "vm2_kv_secrets_user" {
  principal_id         = azurerm_linux_virtual_machine.vm2_linux_it.identity[0].principal_id
  role_definition_name = "Key Vault Administrator"
  scope                = var.kv_dev_sudo_id # KV ID 
}

resource "azurerm_role_assignment" "vm2_kv_secrets_user_read" {
  principal_id         = azurerm_linux_virtual_machine.vm2_linux_it.identity[0].principal_id
  role_definition_name = "Key Vault Reader"
  scope                = var.kv_dev_sudo_id # KV ID 
}

# IT VM-2 
#---------------------------------------------------------------------------------------------------------------#