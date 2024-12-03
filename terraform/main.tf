provider "azurerm" {
  features {}
}

resource "azurerm_container_group" "app_container" {
  name                = "app-container"
  location            = "East US"
  resource_group_name = "my-resource-group"
  os_type             = "Linux"

  container {
    name   = "app-container"
    image  = "<your-docker-image>"  # Replace with your Docker image name
    cpu    = "1.0"
    memory = "1.5"

    ports {
      port     = 3000  # Assuming Express is listening on port 3000
      protocol = "TCP"
    }
  }

  tags = {
    environment = "dev"
  }
}
