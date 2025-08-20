# Zufälliger Suffix für eindeutigen Storage-Account-Namen
resource "random_string" "sa_suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

# Azure Storage Account (Standard, lokal redundant)
resource "azurerm_storage_account" "sa" {
  name                     = "bcblob${random_string.sa_suffix.result}"  # eindeutiger Name mit Suffix
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"  # Local Redundant Storage

  tags = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    created_by  = "terraform"
    type        = "blob-storage"
  }
}

# Blob Container für Aufnahmen
resource "azurerm_storage_container" "recordings" {
  name                  = "recordings"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"  # kein öffentlicher Zugriff
}
