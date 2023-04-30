resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "aks_subnet"
    address_prefix = "10.1.0.0/16"
  }

  subnet {
    name           = "appgw_subnet"
    address_prefix = "10.2.0.0/16"
  }

}

/* resource "azurerm_subnet" "subnets" {
  for_each              = var.subnets
  name                  = each.key
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = [each.value]
} */


