# Projektname (wird z. B. für Resource Group genutzt)
variable "project_name" {
  description = "bc"
  type        = string
  default     = "bandcloud"
}

# Umgebung (z. B. dev oder prod)
variable "environment" {
  description = "Umgebung (dev|prod)"
  type        = string
  default     = "dev"
}

# Azure-Region für allgemeine Ressourcen
variable "location" {
  description = "Azure-Region"
  type        = string
  default     = "West Europe"
}

# Owner-Tag (z. B. für Verantwortliche Person)
variable "owner" {
  description = "Owner-Tag"
  type        = string
  default     = "post@msplatter.at"
}

# SQL-Administrator-Benutzername
variable "sql_admin_username" {
  description = "Admin-Login für Azure SQL (z. B. 'sqladmin')"
  type        = string
  sensitive   = true
}

# SQL-Administrator-Passwort
variable "sql_admin_password" {
  description = "Starkes Passwort für Azure SQL (mind. 8 Zeichen, Groß/Klein/Zahl/Sonderz.)"
  type        = string
  sensitive   = true
}

# Azure-Region speziell für SQL Server (kann abweichen von var.location)
variable "sql-location" {
  description = "Azure-Region für SQL Server"
  type        = string
  default     = "North Europe"
}
