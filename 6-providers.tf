terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      #   version = "2.1.0"
    }
  }
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
  insecure = true
}