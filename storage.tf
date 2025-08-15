# Einmaliges erstellen einer eindeutigen, kleinen Suffix-Zeichenfolge für den Storage-Account
resource "random_string" "sa_suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

# Storage Account (für Blob Storage)
resource "azurerm_storage_account" "sa" {
  name                     = "bcblob${random_string.sa_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    created_by  = "terraform"
    type        = "blob-storage"
  }
}

# Blob Container
resource "azurerm_storage_container" "recordings" {
  name                  = "recordings"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

