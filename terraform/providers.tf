terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.54.0"
    }
  }
  backend "azurerm" {
    storage_account_name        = ""
    resource_group_name         = ""
    container_name              = ""
    key                         = ""
  }
}

provider "azurerm" {
    features {}
}
