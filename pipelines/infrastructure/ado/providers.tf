provider "azuredevops" {
  org_service_url       = var.ado_org_url
  personal_access_token = var.ado_pat
}
