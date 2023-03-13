terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.95.0"
    }
  }
  backend "azurerm" {
    // storage_account_name        = "codechallengechn"
    // resource_group_name         = "Terraform-State-RG"
    // container_name              = "tfstate"
    // key                         = "terraform.tfstate"
    // access_key                  = "6o8jCbOtThyyC9IduWSnwtCblEZkrzKZTzXIwNWl5cvs1t2QI896cUtuJU/Ae6sQN7Nh+PtpEiij+AStGrypJQ=="

    storage_account_name        = ""
    resource_group_name         = ""
    container_name              = ""
    key                         = ""
    // access_key                  = ""
  }
}

provider "azurerm" {
    features {}
}