output "app_service_url" {
  value = azurerm_app_service.main.default_site_hostname
}
