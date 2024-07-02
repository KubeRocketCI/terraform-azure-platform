resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = var.location

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    managedby = "terraform"
  }
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate4khua"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  infrastructure_encryption_enabled = true

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    managedby = "terraform"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
