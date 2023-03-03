data "aci_vmm_domain" "l3out_dev_vmmdom" {
  provider_profile_dn  = "uni/vmmp-VMware"
  name                 = "vmware60-hybridcloud"
}