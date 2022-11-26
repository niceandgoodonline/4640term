###
# variables for provider.tf
###

variable "region" {
  type    = string
  default = "us-west-2"
}

###
# variables for main.tf
###

variable "vpc_name" {
  type    = string
  default = "fr_4640_term_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "vpc_azs" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.20.11.0/24", "10.20.12.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default =  ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "igw_name" {
  type    = string
  default = "fr_4640_term_vpc_igw"
}

variable "tags" {
  type = object({
    Repo        = string
    Environment = string
  })
  default = {
    Repo        = "github.com/niceandgoodonline/4640term"
    Environment = "4640-term"
  }
}
