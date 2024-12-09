aks_subnet_id   = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/network/providers/Microsoft.Network/virtualNetworks/core/subnets/cluster"
appgw_subnet_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/network/providers/Microsoft.Network/virtualNetworks/core/subnets/appgw"

resource_group_name = "KRCIAksRG"

rbac_aad_admin_group_object_ids = ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]

private_cluster_enabled = false

tags = {
  "SysName"      = "KubeRocketCI"
  "SysOwner"     = "email"
  "Environment"  = "CORE-CLUSTER"
  "CostCenter"   = "2024"
  "BusinessUnit" = "KubeRocketCI"
  "Department"   = "platform"
}
