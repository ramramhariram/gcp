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
