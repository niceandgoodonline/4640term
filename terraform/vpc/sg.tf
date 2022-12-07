# define security groups here
resource "aws_security_group" "app_sg" {
  depends_on  = [module.vpc]

  name        = "app_sg"
  description = "Security group for public apps in public subnets"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "HTTPS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "HTTP from ALL"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MYSQL from VPC"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    description = "HTTPS to ALL"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP to ALL"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "MYSQL to VPC"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}


# define security groups here
resource "aws_security_group" "db_sg" {
  depends_on  = [module.vpc]

  name        = "db_sg"
  description = "Security group for db instances in private subnets"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "MYSQL from VPC"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "HTTPS from ALL"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "HTTP from ALL"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTPS to ALL"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "HTTP to ALL"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "MYSQL to VPC"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}
