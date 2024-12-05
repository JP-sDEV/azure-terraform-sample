provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "testing_rg" {
  name     = "testing-resource-group"
  location = "East US"
}

# Create an Azure Container Registry (ACR)
resource "azurerm_container_registry" "myacr" {
  name                     = "myacr"  # The actual Azure registry name (must be unique globally)
  resource_group_name       = azurerm_resource_group.testing_rg.name
  location                 = azurerm_resource_group.testing_rg.location
  sku                       = "Basic"
  admin_enabled            = true
}

# Create an Azure App Service Plan
resource "azurerm_app_service_plan" "myapp_service_plan" {
  name                = "my-app-service-plan"
  location            = azurerm_resource_group.testing_rg.location
  resource_group_name = azurerm_resource_group.testing_rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Create an Azure Web App
resource "azurerm_web_app" "azure_terraform_sample_app" {
  name                = "azure-terraform-sample"
  location            = azurerm_resource_group.testing_rg.location
  resource_group_name = azurerm_resource_group.testing_rg.name
  app_service_plan_id = azurerm_app_service_plan.myapp_service_plan.id
  site_config {
    linux_fx_version = "DOCKER|myacr.azurecr.io/myapp:latest"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.testing_rg.name
}
