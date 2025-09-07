# Key Vault
#---------------------------------------------------------------------------------------------------------------#

output "kv_dev_sudo_id" {
  value = azurerm_key_vault.kv-dev-sudo.id

}

output "kv_dev_sudo_name" {
  value = azurerm_key_vault.kv-dev-sudo.name

}

output "vm1_username_from_kv" {
  value     = azurerm_key_vault_secret.vm1_username_from_kv.value
  sensitive = true

}

output "vm1_password_from_kv" {
  value     = azurerm_key_vault_secret.vm1_password_from_kv.value
  sensitive = true

}

output "vm2_username_from_kv" {
  value     = azurerm_key_vault_secret.vm2_username_from_kv.value
  sensitive = true

}

output "vm2_public_key_from_kv" {
  value     = azurerm_key_vault_secret.vm2_public_key_from_kv.value
  sensitive = true

}

output "vm2_private_key_from_kv" {
  value     = azurerm_key_vault_secret.vm2_private_key_from_kv.value
  sensitive = true

}

# Key Vault
#---------------------------------------------------------------------------------------------------------------#