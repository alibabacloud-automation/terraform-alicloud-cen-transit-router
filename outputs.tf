output "transit_router_id" {
  description = "The id of the transit router."
  value       = concat(alicloud_cen_transit_router.transit_router[*].transit_router_id, [""])[0]
}

output "route_table_id" {
  description = "The id of the transit router route table."
  value       = concat(alicloud_cen_transit_router_route_table.route_table[*].transit_router_route_table_id, [""])[0]
}

output "vpc_attachment_id" {
  description = "The id of the transit router vpc attachment."
  value       = concat(alicloud_cen_transit_router_vpc_attachment.vpc_attachment[*].transit_router_attachment_id, [""])[0]
}

output "route_entry_id" {
  description = "The id of the transit router route entry."
  value       = concat(alicloud_cen_transit_router_route_entry.route_entry[*].id, [""])[0]
}

output "route_map_id" {
  description = "The id of the transit router route map."
  value       = concat(alicloud_cen_route_map.route_map[*].id, [""])[0]
}
