###
# variables for provider.tf
###

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "tags" {
  type = object({
    Repo        = string
    Environment = string
  })
  default = {
    Repo        = "github.com/niceandgoodonline/4640term"
    Environment = "4640term"
  }
}

variable "bucket" {
  type = string
  default = "fr-4640-term-backend"
}
