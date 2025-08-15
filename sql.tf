resource "random_string" "sql_suffix" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "bcsqlserver${random_string.sql_suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.sql-location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Azure SQL Database
resource "azurerm_mssql_database" "db" {
  name           = "bcdb"
  server_id      = azurerm_mssql_server.sql_server.id

  sku_name       = "S0"
  max_size_gb    = 5

  tags = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    created_by  = "terraform"
  }
}

