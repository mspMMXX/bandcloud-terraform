# Resource Group für alle BandCloud-Ressourcen
resource "azurerm_resource_group" "rg" {
  name     = var.project_name   # Projektname als RG-Name
  location = var.location       # Standort (z. B. westeurope)
}
