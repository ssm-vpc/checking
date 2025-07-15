provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_cidr
  vpc_name = var.vpc_name
}
