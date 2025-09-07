# Key Vault
#---------------------------------------------------------------------------------------------------------------#

# Creating KV
resource "azurerm_key_vault" "kv-dev-sudo" {
  name                       = var.kv_name
  location                   = var.region
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.current_tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name                      = var.kv_sku
  enable_rbac_authorization     = true # RBAC-based access enabled
  public_network_access_enabled = true #false

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow" # Change to "Deny" for stricter security (optional)

    # virtual_network_subnet_ids = [
    #   var.it_sub_id,    // module.network.it_sub_id 
    #   var.it_bas_sub_id // module.network.it_bas_sub_id
    # ]
  }
}

# Assign roles
data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "current_user_identity" {
  principal_id         = data.azurerm_client_config.current.object_id # Current user identity to grant the role
  role_definition_name = "Key Vault Administrator"                    # RBAC role
  scope                = azurerm_key_vault.kv-dev-sudo.id
}


# Creating secrets

# VM
resource "azurerm_key_vault_secret" "vm1_username_from_kv" {
  name         = "vm1-username"
  value        = "vm1-user"
  key_vault_id = azurerm_key_vault.kv-dev-sudo.id
}

resource "azurerm_key_vault_secret" "vm1_password_from_kv" {
  name         = "vm1-password"
  value        = "vm1-P$ssw0rdisf0und"
  key_vault_id = azurerm_key_vault.kv-dev-sudo.id
}

resource "azurerm_key_vault_secret" "vm2_username_from_kv" {
  name         = "vm2-username"
  value        = "vm2-user"
  key_vault_id = azurerm_key_vault.kv-dev-sudo.id
}

resource "azurerm_key_vault_secret" "vm2_public_key_from_kv" {
  name         = "vm2-public-key"
  value        = file("C:/Users/<your-username>/.ssh/vm2-linux.pub")
  key_vault_id = azurerm_key_vault.kv-dev-sudo.id
}

resource "azurerm_key_vault_secret" "vm2_private_key_from_kv" {
  name         = "vm2-private-key"
  value        = file("C:/Users/<your-username>/.ssh/vm2-linux.pem")
  key_vault_id = azurerm_key_vault.kv-dev-sudo.id
}
# VM


# Key Vault
#---------------------------------------------------------------------------------------------------------------#