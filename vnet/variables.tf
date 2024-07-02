variable "location" {
  description = "The Azure Region in which all resources will be created."
  type        = string
  default     = "germanywestcentral"
}

variable "use_for_each" {
  description = "Use for_each to create multiple resources."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(any)
  default     = {}
}
