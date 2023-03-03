locals {
  model = {
    tenant = {
      name = "SNOW-${var.request_number}"
      description = "TN requested from ServiceNow, automated by terraform"
      vrf  = "vrf-snow"
      bridge_domain = [
        {
          name   = "bd-10.1.0.0_24"
          subnet = "10.1.0.1/24"
        },
        {
          name   = "bd-10.2.0.0_24"
          subnet = "10.2.0.1/24"
        },
      ]
      app_profile = {
        name = "anp-network-segments"
        epg = [
          {
            name = "epg-10.1.0.0_24"
            bd_name = "bd-10.1.0.0_24"
          },
          {
            name = "epg-10.2.0.0_24"
            bd_name = "bd-10.2.0.0_24"
          },
        ]
      }
    }
  }
}