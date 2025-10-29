variable "vpc_name"        { type = string }
variable "vpc_cidr"        { type = string }          # 예: 10.18.0.0/16
variable "azs"             { type = list(string) }    # 예: ["ap-northeast-2a","ap-northeast-2c"]

# 각 AZ별 서브넷 CIDR 리스트 (길이는 azs와 동일해야 함)
variable "public_subnets"  { type = list(string) }    # 예: ["10.18.0.0/19","10.18.32.0/19"]
variable "private_subnets" { type = list(string) }    # 예: ["10.18.64.0/19","10.18.96.0/19"]

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

# 태그 공통
variable "tags" {
  type    = map(string)
  default = {}
}
