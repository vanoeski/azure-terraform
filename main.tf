provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-tf-rg"
  location = "East US"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  numeric  = true
  special = false
}


resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id  = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}

