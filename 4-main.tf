##################################
# Create tenant 
##################################

resource "aci_tenant" "user_tenant" {
  name        = local.model.tenant.name
  description = local.model.tenant.description
}

##################################
# User tenant networking
##################################

resource "aci_vrf" "user_vrf" {
  tenant_dn   = aci_tenant.user_tenant.id
  name        = local.model.tenant.vrf
  description = "Automated by Terraform"
}

module "create_bd_subnet" {
  source    = "./tfmodules/bd_subnet"
  count     = length(local.model.tenant.bridge_domain)
  tenant_id = aci_tenant.user_tenant.id
  vrf_id    = aci_vrf.user_vrf.id
  bd        = local.model.tenant.bridge_domain[count.index]
}

##################################
# App profile and EPGs
##################################

resource "aci_application_profile" "demo_app_anp" {
  tenant_dn   = aci_tenant.user_tenant.id
  name        = local.model.tenant.app_profile.name
  description = "Automated by Terraform"
}

module "create_epg" {
  source         = "./tfmodules/epg"
  count          = length(local.model.tenant.app_profile.epg)
  epg_name       = local.model.tenant.app_profile.epg[count.index].name
  bd_name        = local.model.tenant.app_profile.epg[count.index].bd_name
  vrf_id         = aci_vrf.user_vrf.id
  tenant_id      = aci_tenant.user_tenant.id
  app_profile_id = aci_application_profile.demo_app_anp.id

  depends_on = [
    module.create_bd_subnet
  ]
}