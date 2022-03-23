resource "alicloud_cen_transit_router" "transit_router" {
  count                      = var.create_transit_router ? 1 : 0
  transit_router_name        = var.transit_router_name
  transit_router_description = var.transit_router_description
  cen_id                     = var.cen_id
}

resource "alicloud_cen_transit_router_route_table" "route_table" {
  count                                  = var.create_route_table ? 1 : 0
  transit_router_id                      = local.this_transit_router_id
  transit_router_route_table_name        = var.transit_router_route_table_name
  transit_router_route_table_description = var.transit_router_route_table_description
}

resource "alicloud_cen_transit_router_vpc_attachment" "vpc_attachment" {
  count                                 = var.create_vpc_attachment ? 1 : 0
  cen_id                                = var.cen_id
  transit_router_id                     = local.this_transit_router_id
  vpc_id                                = var.vpc_id
  transit_router_attachment_name        = var.transit_router_attachment_name
  transit_router_attachment_description = var.transit_router_attachment_description
  dynamic "zone_mappings" {
    for_each = var.zone_mappings
    content {
      vswitch_id = lookup(zone_mappings.value, "vswitch_id", null)
      zone_id    = lookup(zone_mappings.value, "zone_id", null)
    }
  }
}

resource "alicloud_cen_transit_router_route_entry" "route_entry" {
  count                                             = var.create_route_entry ? 1 : 0
  transit_router_route_table_id                     = local.this_transit_router_route_table_id
  transit_router_route_entry_destination_cidr_block = var.transit_router_route_entry_destination_cidr_block
  transit_router_route_entry_next_hop_type          = var.transit_router_route_entry_next_hop_type
  transit_router_route_entry_name                   = var.transit_router_route_entry_name
  transit_router_route_entry_description            = var.transit_router_route_entry_description
  transit_router_route_entry_next_hop_id            = local.this_transit_router_route_entry_next_hop_id
}

resource "alicloud_cen_route_map" "route_map" {
  depends_on = [
    alicloud_cen_transit_router_route_table.route_table
  ]
  count              = var.create_route_map ? 1 : 0
  cen_region_id      = var.cen_region_id
  cen_id             = var.cen_id
  description        = var.route_map_description
  priority           = var.priority
  transmit_direction = var.transmit_direction
  map_result         = var.map_result
  source_region_ids  = var.source_region_ids
}

