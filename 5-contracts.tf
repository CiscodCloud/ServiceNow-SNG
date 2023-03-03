####################################################################
### CONTRACTS
####################################################################

### Permit-any ###
resource "aci_contract" "permit_any_contract" {
    tenant_dn   =  aci_tenant.user_tenant.id
    description = "Automated by Terraform"
    name        = "con-permit-any"
    scope       = "context"
}
resource "aci_contract_subject" "permit_any_contract_subject" {
    contract_dn   = aci_contract.permit_any_contract.id
    description   = "Automated by Terraform"
    name          = "sbj-permit-any"
}
resource "aci_contract_subject_filter" "permit_any_contract_subject_filter" {
  contract_subject_dn  = aci_contract_subject.permit_any_contract_subject.id
  filter_dn  = aci_filter.permit_any_filter.id
}