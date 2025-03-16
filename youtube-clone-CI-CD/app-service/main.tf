resource "azurerm_service_plan" "app_service_plan" {
  name                = var.as_plan_name
  resource_group_name = var.resource_group_name
  location            = var.region
  os_type             = var.as_os_type
  sku_name            = var.as_sku

  tags = var.tags
}

resource "azurerm_linux_web_app" "app_service" {
  name                          = var.as_name
  resource_group_name           = var.resource_group_name
  location                      = var.region
  service_plan_id               = azurerm_service_plan.app_service_plan.id
  public_network_access_enabled = true

  site_config {
    always_on = false
    application_stack {
      node_version = var.node_version
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}