# Terraform-Konfiguration: Provider-Definitionen
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"   # AzureRM-Provider ab Version 3
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"   # Random-Provider für eindeutige Namen/IDs
    }
  }
}

# Azure Provider (Authentifizierung über Subscription)
provider "azurerm" {
  features {}
  subscription_id = "d33af804-8e46-4404-b3d0-958d60fe0a38"  # Azure Subscription-ID
}
