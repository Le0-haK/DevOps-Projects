# Local AS Var
variable "as_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "as_os_type" {
  description = "Name of the App Service OS Type"
  type        = string
}

variable "as_sku" {
  description = "SKU for the App Service Plan"
  type        = string
}

variable "as_name" {
  description = "Name of the App Service Name"
  type        = string
}

variable "node_version" {
  description = "The NodeJS version for the App Service"
  type        = string
  default     = "18-lts"
}

# Local AS Var