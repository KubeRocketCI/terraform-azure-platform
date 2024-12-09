variable "create_resource_group" {
  type        = bool
  default     = true
  nullable    = false
  description = "Create a new resource group for the AKS cluster."
}

variable "aks_subnet_id" {
  type        = string
  description = "The ID of the subnet in which to create the AKS cluster."
}

variable "appgw_subnet_id" {
  type        = string
  description = "The ID of the subnet in which to create the AKS cluster."
}


variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
  default     = "germanywestcentral"
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "The name of the resource group in which to create the AKS cluster."
}

variable "private_cluster_enabled" {
  type        = bool
  description = "A flag indicating whether or not to create a private AKS cluster."
  default     = true
}

variable "rbac_aad_admin_group_object_ids" {
  type        = list(string)
  description = "List of object IDs for the RBAC Azure AD admin group."
  default     = []
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(any)
  default     = {}
}
