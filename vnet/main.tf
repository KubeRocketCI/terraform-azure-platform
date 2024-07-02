resource "azurerm_resource_group" "dev" {
  location = var.location
  name     = "network"
  tags     = var.tags
}

module "vnet" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  vnet_name           = "core"
  resource_group_name = azurerm_resource_group.dev.name
  use_for_each        = var.use_for_each
  address_spaces      = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.0.0/19", "10.0.32.0/24", "10.0.33.0/24", "10.0.34.0/24"]
  subnet_names        = ["cluster", "ingress", "appgw", "privatelink"]

  tags = var.tags

  depends_on = [azurerm_resource_group.dev]
}
