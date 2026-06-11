terraform {
  backend "azurerm" {}

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.15"
    }
  }
}
