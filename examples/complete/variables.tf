#################
# CEN Transit Router
#################
variable "transit_router_name" {
  description = "The name of the transit router."
  type        = string
  default     = "tf-test-transit-router"
}

variable "transit_router_description" {
  description = "The description of the transit router."
  type        = string
  default     = "tf-test-transit-router"
}

#################
# Route Table
#################
variable "transit_router_route_table_name" {
  description = "The name of the transit router route table."
  type        = string
  default     = "tf-test-route-table"
}

variable "transit_router_route_table_description" {
  description = "The description of the transit router route table."
  type        = string
  default     = "tf-test-route-table"
}

#################
# VPC Attachment
#################
variable "transit_router_attachment_name" {
  description = "The name of the transit router vpc attachment."
  type        = string
  default     = "tf-test-vpc-attachment"
}

variable "transit_router_attachment_description" {
  description = "The description of the transit router vpc attachment."
  type        = string
  default     = "tf-test-vpc-attachment"
}

#################
# Route Entry
#################
variable "transit_router_route_entry_name" {
  description = "The name of the transit router route entry."
  type        = string
  default     = "tf-test-route-entry"
}

variable "transit_router_route_entry_description" {
  description = "The description of the transit router route entry."
  type        = string
  default     = "tf-test-route-entry"
}

#################
# Route Map
#################

variable "route_map_description" {
  description = "The description of the route map."
  type        = string
  default     = "tf-test-route-map"
}

variable "priority" {
  description = "(Required) The priority of the route map. Value range: 1 to 100. A lower value indicates a higher priority."
  type        = number
  default     = 1
}

variable "map_result" {
  description = "(Required) The action that is performed to a route if the route matches all the match conditions. Valid values: Permit, Deny."
  type        = string
  default     = "Permit"
}

variable "source_region_ids" {
  description = "A match statement that indicates the list of IDs of the source regions. You can enter a maximum of 32 region IDs."
  type        = list(string)
  default     = ["cn-beijing"]
}
