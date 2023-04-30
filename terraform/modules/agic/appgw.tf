data "azurerm_subnet" "appgw_subnet" {
  name                 = var.appgw_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_public_ip" "pip" {
  name                = var.appgw_pip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.appgw_subnet.id
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  frontend_port {
    name = "myFrontendPort"
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  backend_address_pool {
    name = "myBackendPool"
  }

  backend_http_settings {
    name                  = "myHttpSettings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "myHttpListener"
    frontend_ip_configuration_name = "myFrontendIpConfig"
    frontend_port_name             = "myFrontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "myRoutingRule"
    rule_type                  = "Basic"
    http_listener_name         = "myHttpListener"
    backend_address_pool_name  = "myBackendPool"
    backend_http_settings_name = "myHttpSettings"
    priority = 100
  }
}