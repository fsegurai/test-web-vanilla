variable "ado_org_url" {
  type        = string
  description = "Azure DevOps organization URL"
}

variable "ado_pat" {
  type        = string
  description = "Azure DevOps personal access token"
  sensitive   = true
}

variable "project_name" {
  type        = string
  description = "Name of the Azure DevOps project"
  default     = "Example Project"
}

variable "work_item_template" {
  type        = string
  description = "Work item template for the project"
  default     = "Agile"
}

variable "version_control" {
  type        = string
  description = "Version control system"
  default     = "Git"
}

variable "visibility" {
  type        = string
  description = "Project visibility"
  default     = "private"
}

variable "description" {
  type        = string
  description = "Project description"
  default     = "Managed by Terraform"
}

variable "variable_group_name" {
  type        = string
  description = "Name of the variable group"
  default     = "Example Variable Group"
}

variable "variable_group_secrets" {
  type        = map(string)
  description = "Secret variables to inject into the variable group"
  default     = {}
}

variable "non_secret_variable_name" {
  type        = string
  description = "Name of the non-secret variable"
  default     = "key2"
}

variable "non_secret_variable_value" {
  type        = string
  description = "Value of the non-secret variable"
  default     = "val2"
}
