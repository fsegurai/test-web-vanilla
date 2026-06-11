resource "azuredevops_project" "example" {
  name               = var.project_name
  work_item_template = var.work_item_template
  version_control    = var.version_control
  visibility         = var.visibility
  description        = var.description
}

resource "azuredevops_project_features" "example-features" {
  project_id = azuredevops_project.example.id
  features = {
    boards    = "enabled"
    repositories = "enabled"
    pipelines = "enabled"
    testplans = "disabled"
    artifacts  = "disabled"
  }
}

resource "azuredevops_project_tags" "example" {
  project_id = azuredevops_project.example.id
  tags       = [
    "terraform",
    "example",
    "managed-by-terraform"
  ]
}

resource "azuredevops_variable_group" "example" {
  project_id   = azuredevops_project.example.id
  name         = var.variable_group_name
  description  = "Managed by Terraform"
  allow_access = true

  dynamic "variable" {
    for_each = var.variable_group_secrets
    content {
      name         = variable.key
      secret_value = variable.value
      is_secret    = true
    }
  }

  lifecycle {
    ignore_changes = [variable]
  }
}

resource "azuredevops_variable_group_variable" "non_secret_example" {
  project_id        = azuredevops_project.example.id
  variable_group_id = azuredevops_variable_group.example.id
  name              = var.non_secret_variable_name
  value             = var.non_secret_variable_value
}
