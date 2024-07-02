resource "random_id" "prefix" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, "${random_id.prefix.hex}-rg")
}

locals {
  resource_group = {
    name     = var.create_resource_group ? azurerm_resource_group.main[0].name : var.resource_group_name
    location = var.location
  }
}

### ACR
resource "random_string" "acr_suffix" {
  length  = 8
  numeric = true
  special = false
  upper   = false
}

resource "azurerm_container_registry" "core" {
  location            = local.resource_group.location
  name                = "core${random_string.acr_suffix.result}"
  resource_group_name = local.resource_group.name
  sku                 = "Basic"
}

### AKS

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "8.0.0"

  cluster_name = "core"


  private_cluster_enabled         = var.private_cluster_enabled
  enable_node_public_ip           = false
  rbac_aad_managed                = true
  rbac_aad_admin_group_object_ids = var.rbac_aad_admin_group_object_ids
  # Microsoft Entra ID with Azure RBAC
  rbac_aad_azure_rbac_enabled       = true
  role_based_access_control_enabled = true

  # https://learn.microsoft.com/en-us/azure/aks/workload-identity-deploy-cluster
  workload_identity_enabled = true
  oidc_issuer_enabled       = true

  prefix                    = "core"
  resource_group_name       = local.resource_group.name
  kubernetes_version        = "1.29"
  automatic_channel_upgrade = "patch"

  # attach the ACR to the AKS cluster
  attached_acr_id_map = {
    core = azurerm_container_registry.core.id
  }

  agents_availability_zones = ["1", "2"]
  # autoscaling
  agents_count     = null
  agents_max_count = 5
  agents_max_pods  = 100
  agents_min_count = 1
  agents_pool_name = "main"
  agents_pool_linux_os_configs = [
    {
      transparent_huge_page_enabled = "always"
      sysctl_configs = [
        {
          fs_aio_max_nr               = 65536
          fs_file_max                 = 100000
          fs_inotify_max_user_watches = 1000000
        }
      ]
    }
  ]
  agents_type = "VirtualMachineScaleSets"
  agents_tags = var.tags

  # since agents_count=null, the cluster will be created with auto-scaling enabled
  enable_auto_scaling = true

  # https://learn.microsoft.com/en-us/azure/governance/policy/concepts/policy-for-kubernetes
  azure_policy_enabled = true

  net_profile_dns_service_ip = "172.29.0.10"
  net_profile_service_cidr   = "172.29.0.0/22"
  net_profile_outbound_type  = "loadBalancer"
  network_plugin             = "azure"
  network_policy             = "azure"
  node_os_channel_upgrade    = "NodeImage"
  os_disk_size_gb            = 30
  sku_tier                   = "Free"
  vnet_subnet_id             = var.aks_subnet_id

  green_field_application_gateway_for_ingress = {
    name      = "krci-agw"
    subnet_id = var.appgw_subnet_id
  }

  maintenance_window = {
    allowed = [
      {
        day   = "Saturday",
        hours = [22, 23]
      },
    ]
  }

  maintenance_window_node_os = {
    frequency  = "Daily"
    interval   = 1
    start_time = "02:00"
    utc_offset = "+03:00"
    duration   = 16
  }

  tags = var.tags

  depends_on = [azurerm_resource_group.main]
}
