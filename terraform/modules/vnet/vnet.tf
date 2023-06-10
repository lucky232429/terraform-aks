resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  
  tags = {
    "Environment"         = var.Environment
    "Created By"          = var.Created_By
  }

}

resource "azurerm_subnet" "aks-subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/16"]
}


