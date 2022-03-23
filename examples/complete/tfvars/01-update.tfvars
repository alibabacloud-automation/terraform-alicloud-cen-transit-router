#alicloud_cen_transit_router
transit_router_name        = "tf-update-test-transit-router"
transit_router_description = "tf-update-test-transit-router"
#alicloud_cen_transit_router_route_table
transit_router_route_table_name        = "tf-update-test-route-table"
transit_router_route_table_description = "tf-update-test-route-table"
#alicloud_cen_transit_router_vpc_attachment
transit_router_attachment_name        = "tf-update-test-vpc-attachment"
transit_router_attachment_description = "tf-update-test-vpc-attachment"
#alicloud_cen_route_map
route_map_description = "tf-update-test-route-map"
priority              = 2
map_result            = "Deny"
source_region_ids     = ["cn-shanghai"]
