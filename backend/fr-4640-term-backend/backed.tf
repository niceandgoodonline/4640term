terraform {
  backend "s3" {
    bucket = "fr-4640-term-backend"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
