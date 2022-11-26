#root tf file

module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "3.11.0"
  name                    = var.vpc_name
  cidr                    = var.vpc_cidr
  map_public_ip_on_launch = true

  azs                     = var.vpc_azs
  private_subnets         = var.vpc_public_subnets
  public_subnets          = var.vpc_private_subnets

  igw_tags = {
    "Name"      = var.igw_name
  }

  tags     = var.tags
}
