# Ausgabe: Name der Resource Group
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Ausgabe: Name des Storage Accounts
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

# Ausgabe: Name des Storage Containers
output "storage_container_name" {
  value = azurerm_storage_container.recordings.name
}

# Ausgabe: FQDN des SQL Servers
output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

# Ausgabe: Name der SQL-Datenbank
output "sql_database_name" {
  value = azurerm_mssql_database.db.name
}

# Ausgabe: Vorlage für ADO.NET Connection String (ohne Secrets)
output "sql_ado_connection_string_template" {
  value = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=<USERNAME>;Password=<PASSWORD>;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

# Ausgabe: URL der Web App
output "web_app_url" {
  value = "https://${azurerm_linux_web_app.web_app.default_hostname}"
}
