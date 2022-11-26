terraform {
  backend "s3" {
    bucket = "fr-4640-term-backend"
    key    = "ec2/terraform.tfstate"
    region = "us-west-2"
  }
}
