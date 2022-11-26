module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = {for instance in local.ec2instances: instance.name => instance}

  ami                    = each.value.ami_id
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  tags                   = each.value.tags
}
