# GCP Transit Module
module "gcp_transit_1" {
  source           = "github.com/terraform-aviatrix-modules/terraform-aviatrix-gcp-transit"
  #version         = "1.0.1"
  ha_gw            = true
  ha_region        = var.gcp_ha_region
  cidr             = var.gcp_cidr
  ha_cidr          = var.gcp_ha_cidr
  region           = var.gcp_region
  account          = var.gcp_account_name
}

# GCP Spoke Module
module "gcp_spoke_1" {
  source           = "github.com/terraform-aviatrix-modules/terraform-aviatrix-gcp-spoke"
  #version         = "1.0.1"
  name = "gcp-demo" 
  account = var.gcp_account_name
  region = var.gcp_spoke_region
  cidr = var.gcp_spoke_cidr
  transit_gw = "${module.gcp_transit_1.transit_gateway}"
  ha_region = var.gcp_spoke_ha_region
  ha_cidr = var.gcp_spoke_ha_cidr
  ha_gw = true 
}


