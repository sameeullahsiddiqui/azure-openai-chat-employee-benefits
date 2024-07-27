provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_app_service_plan" "asp" {
  name                = "myAppServicePlan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "myAppService"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

resource "azurerm_openai" "openai" {
  name                = var.openai_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_search_service" "search" {
  name                = var.search_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "basic"
  partition_count     = 1
  replica_count       = 1
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  value = azurerm_container_registry.acr.admin_password
}

output "app_service_url" {
  value = azurerm_app_service.app.default_site_hostname
}

output "openai_endpoint" {
  value = azurerm_openai.openai.endpoint
}

output "search_endpoint" {
  value = azurerm_search_service.search.endpoint
}
