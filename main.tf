# GCP Transit Module
module "gcp_transit_1" {
  source           = "github.com/terraform-aviatrix-modules/terraform-aviatrix-gcp-transit"
  #version         = "1.0.1"
  ha_gw            = true
  ha_region        = var.gcp_second_region
  sub1_cidr        = var.gcp_sub1_cidr
  sub2_cidr        = var.gcp_sub2_cidr
  primary_region   = var.gcp_primary_region
  account          = var.gcp_account_name
}

# GCP Spoke Module
module "gcp_spoke_1" {
  source           = "github.com/terraform-aviatrix-modules/terraform-aviatrix-gcp-spoke"
  #version         = "1.0.1"
  name = "gcp-demo" 
  account = var.gcp_account_name
  region = var.gcp_spoke_region
  cidr = var.gcp_spoke_sub1_cidr
  transit_gateway = module.gcp_transit_1.transit_gateway.gw_name
}


