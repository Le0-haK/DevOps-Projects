# Global Var
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the Name for the Resource Group."
}

variable "region" {
  type        = string
  description = "(Required) Specifies the location/region where the vnets will be created"
}

variable "tags" {
  description = "(Optional) Specifies the tags to be assigned to all the resources"
  type        = map(any)
}

# Global Var

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
  #default = "18-lts"   
}

# Local AS Var