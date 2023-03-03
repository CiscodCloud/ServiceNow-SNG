####################################################################
### FILTERS
####################################################################

### Permit ANY Filter ###
resource "aci_filter" "permit_any_filter" {
    tenant_dn   = aci_tenant.user_tenant.id
    description = "Automated by Terraform"
    name        = "flt-permit-any"
}

### Permit ANY Filter Entry ###
resource "aci_filter_entry" "permit_any_filter_entry" {
    filter_dn     = aci_filter.permit_any_filter.id
    description   = "Automated by Terraform"
    name          = "any"
    d_from_port   = "unspecified"
    d_to_port     = "unspecified"
}
