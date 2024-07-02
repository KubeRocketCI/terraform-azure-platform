# Azure Kubernetes Service Module

<!-- BEGIN_TF_DOCS -->




## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.106.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | Azure/aks/azurerm | 8.0.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.11.0, <4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.3.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_subnet_id"></a> [aks\_subnet\_id](#input\_aks\_subnet\_id) | The ID of the subnet in which to create the AKS cluster. | `string` | n/a | yes |
| <a name="input_appgw_subnet_id"></a> [appgw\_subnet\_id](#input\_appgw\_subnet\_id) | The ID of the subnet in which to create the AKS cluster. | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Create a new resource group for the AKS cluster. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this example should be created. | `string` | `"germanywestcentral"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | A flag indicating whether or not to create a private AKS cluster. | `bool` | `true` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | List of object IDs for the RBAC Azure AD admin group. | `list(string)` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the AKS cluster. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all resources | `map(any)` | `{}` | no |



## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.core](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_id.prefix](https://registry.terraform.io/providers/hashicorp/random/3.3.2/docs/resources/id) | resource |
| [random_string.acr_suffix](https://registry.terraform.io/providers/hashicorp/random/3.3.2/docs/resources/string) | resource |
<!-- END_TF_DOCS -->
