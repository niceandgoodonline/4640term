variable "region" {
  type = string
  default = "us-west-2"
}

variable "vpc_id" {
  type = string
}

variable "ec2_config" {
  description = "variables to differentiate between front and backend EC2 intances"
  default = [{}]
}

################ LOCALS ###############

locals {
  ec2config = [
    for instance in var.ec2_config : [{
      name                   = instance.name
      ami_id                 = instance.ami_id
      instance_type          = instance.instance_type
      subnet_id              = instance.subnet_id
      vpc_security_group_ids = instance.vpc_security_group_ids
      iam_instance_profile   = instance.iam_instance_profile
      user_data              = instance.user_data
      tags                   = instance.tags
    }]
  ]
}

locals {
  ec2instances = flatten(local.ec2config)
}
