variable "region" {
  default = "cn-hangzhou"
}

provider "alicloud" {
  region = var.region
}

resource "alicloud_vpc" "vpc" {
  name       = "tf-test-transit-router"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_vswitch" "master_vswitch" {
  name              = "tf-test-transit-router"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "cn-hangzhou-h"
}

resource "alicloud_vswitch" "slave_vswitch" {
  name              = "tf-test-transit-router"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "cn-hangzhou-i"
}

resource "alicloud_cen_instance" "cen_instance" {
  cen_instance_name = "tf_test_cen_transit_router"
  description       = "tf_test_cen_transit_router"
}

module "example" {
  source = "../.."

  #alicloud_cen_transit_router
  create_transit_router      = true
  transit_router_name        = var.transit_router_name
  transit_router_description = var.transit_router_description
  cen_id                     = alicloud_cen_instance.cen_instance.id

  #alicloud_cen_transit_router_route_table
  create_route_table                     = true
  transit_router_route_table_name        = var.transit_router_route_table_name
  transit_router_route_table_description = var.transit_router_route_table_description

  #alicloud_cen_transit_router_vpc_attachment
  create_vpc_attachment                 = true
  vpc_id                                = alicloud_vpc.vpc.id
  transit_router_attachment_name        = var.transit_router_attachment_name
  transit_router_attachment_description = var.transit_router_attachment_description
  zone_mappings                         = [{ zone_id : "cn-hangzhou-h", vswitch_id : alicloud_vswitch.master_vswitch.id }, { zone_id : "cn-hangzhou-i", vswitch_id : alicloud_vswitch.slave_vswitch.id }]

  #alicloud_cen_transit_router_route_entry
  create_route_entry                                = true
  transit_router_route_entry_destination_cidr_block = "192.168.0.0/24"
  transit_router_route_entry_next_hop_type          = "Attachment"
  transit_router_route_entry_name                   = var.transit_router_route_entry_name
  transit_router_route_entry_description            = var.transit_router_route_entry_description

  #alicloud_cen_route_map
  create_route_map      = true
  cen_region_id         = var.region
  route_map_description = var.route_map_description
  priority              = var.priority
  transmit_direction    = "RegionIn"
  map_result            = var.map_result
  source_region_ids     = var.source_region_ids
}