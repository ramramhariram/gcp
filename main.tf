# AWS Transit Module
module "aws_transit_1" {
  source           = "github.com/terraform-aviatrix-modules/terraform-aviatrix-aws-transit-firenet"
  #version          = "1.0.1"
  ha_gw            = true
  cidr             = var.cidr
  region           = var.region
  account          = var.account
  #name             = var.name
  firewall_image   = var.firewall_image
  iam_role         = var.iam_role
  bootstrap_bucket_name = var.bootstrap_bucket_name
  egress_enabled   = var.egress_enabled
  fw_instance_size = var.fw_instance_size
}

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
  gcp_account_name = var.gcp_account_name
  gcp_spoke_region = var.gcp_spoke_region
  gcp_spoke_sub1_cidr = var.gcp_spoke_sub1_cidr
  transit_gateway = module.gcp_transit_1.transit_gateway.gw_name
}


