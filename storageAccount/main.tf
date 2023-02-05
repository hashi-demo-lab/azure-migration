terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "Australia East"
}

resource "azurerm_storage_account" "tfstate" {
  name                          = "tfstatesl1"
  resource_group_name           = azurerm_resource_group.tfstate.name
  location                      = azurerm_resource_group.tfstate.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstatesl1"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}