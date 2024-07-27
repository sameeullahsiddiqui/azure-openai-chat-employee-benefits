output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "acr_admin_password" {
  description = "The admin password for the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_password
}

output "acr_login_server" {
  description = "The login server URL for the Azure Container Registry."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "The admin username for the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_username
}


