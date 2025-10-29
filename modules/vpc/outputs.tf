output "vpc_id"                   { value = module.vpc.vpc_id }
output "public_subnets"           { value = module.vpc.public_subnets }
output "private_subnets"          { value = module.vpc.private_subnets }
output "nat_public_ips"           { value = try(module.vpc.nat_public_ips, []) }
output "igw_id"                   { value = try(module.vpc.igw_id, null) }
output "route_table_public_ids"   { value = try(module.vpc.public_route_table_ids, []) }
output "route_table_private_ids"  { value = try(module.vpc.private_route_table_ids, []) }
