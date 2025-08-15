# App Service Plan (Linux, .NET)
resource "azurerm_service_plan" "app_service_plan" {
  name                = "bandcloud-appplan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

# Web App (für API)
resource "azurerm_linux_web_app" "web_app" {
  name                = "bandcloud-api"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  https_only = true

app_settings = {
  STORAGE_ACCOUNT_NAME = azurerm_storage_account.sa.name
  STORAGE_CONTAINER    = azurerm_storage_container.recordings.name
  SQL_SERVER           = azurerm_mssql_server.sql_server.fully_qualified_domain_name
  SQL_DATABASE         = azurerm_mssql_database.db.name
}


  site_config {
    application_stack {
      dotnet_version = "8.0"
    }
  }

  tags = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    created_by  = "terraform"
  }
}
