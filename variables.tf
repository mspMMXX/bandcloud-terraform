variable "project_name" {
  description = "bc"
  type        = string
  default     = "bandcloud"
}

variable "environment" {
  description = "Umgebung (dev|prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure-Region"
  type        = string
  default     = "West Europe"
}

variable "owner" {
  description = "Owner-Tag"
  type        = string
  default     = "post@msplatter.at"
}

variable "sql_admin_username" {
  description = "Admin-Login für Azure SQL (z. B. 'sqladmin')"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "Starkes Passwort für Azure SQL (mind. 8 Zeichen, Groß/Klein/Zahl/Sonderz.)"
  type        = string
  sensitive   = true
}

variable "sql-location" {
  description = "Azure-Region für SQL Server"
  type        = string
  default     = "North Europe"
}