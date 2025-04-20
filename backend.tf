terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-tf-rg"
    storage_account_name = "tfstate35zeg3" # You’ll fill this in later
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
