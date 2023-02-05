terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
  }


  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatesl1"
    container_name       = "tfstatesl1"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "Australia East"
}