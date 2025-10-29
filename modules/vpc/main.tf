locals {
  common_tags = merge(
    {
      "Project" = var.vpc_name
      "Managed" = "terraform"
    },
    var.tags
  )
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  # 권장 태그
  tags = local.common_tags

  # 퍼블릭 서브넷에서 퍼블릭 IP 부여 (필요 시 조정)
  map_public_ip_on_launch = true
}
