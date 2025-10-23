locals {
  # Get ID of cen resources
  this_transit_router_id                      = var.create_transit_router ? concat(alicloud_cen_transit_router.transit_router[*].transit_router_id, [""])[0] : var.transit_router_id
  this_transit_router_route_table_id          = var.create_route_table ? concat(alicloud_cen_transit_router_route_table.route_table[*].transit_router_route_table_id, [""])[0] : var.transit_router_route_table_id
  this_transit_router_route_entry_next_hop_id = var.create_vpc_attachment ? concat(alicloud_cen_transit_router_vpc_attachment.vpc_attachment[*].transit_router_attachment_id, [""])[0] : var.transit_router_route_entry_next_hop_id
}