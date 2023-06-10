resource "azurerm_container_registry" "acr" {
  name                = "${var.acr_name}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false

  tags = {
    "Environment"         = var.Environment
    "Created By"          = var.Created_By
  }
}