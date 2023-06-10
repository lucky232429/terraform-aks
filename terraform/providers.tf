terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.54.0"
    }
  }
  backend "azurerm" {
    storage_account_name        = "chnterraformaksdemo"
    resource_group_name         = "Terraform-Remote-State-RG"
    container_name              = "tfstate"
    key                         = "demo.tfstate"
  }
}

provider "azurerm" {
    features {}
}
