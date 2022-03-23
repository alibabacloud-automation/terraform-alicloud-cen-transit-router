#################
# CEN Transit Router
#################
variable "create_transit_router" {
  description = "Controls if transit router should be created"
  type        = bool
  default     = false
}

variable "transit_router_id" {
  description = "The id of transit router."
  type        = string
  default     = ""
}

variable "transit_router_name" {
  description = "The name of the transit router."
  type        = string
  default     = ""
}

variable "transit_router_description" {
  description = "The description of the transit router."
  type        = string
  default     = ""
}

variable "cen_id" {
  description = "(Required, ForceNew) The ID of the CEN."
  type        = string
  default     = ""
}

#################
# Route Table
#################
variable "create_route_table" {
  description = "Controls if route table should be created"
  type        = bool
  default     = false
}

variable "transit_router_route_table_id" {
  description = "The id of the transit router route table."
  type        = string
  default     = ""
}

variable "transit_router_route_table_name" {
  description = "The name of the transit router route table."
  type        = string
  default     = ""
}

variable "transit_router_route_table_description" {
  description = "The description of the transit router route table."
  type        = string
  default     = ""
}

#################
# VPC Attachment
#################
variable "create_vpc_attachment" {
  description = "Controls if vpc attachment should be created"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "(Required, ForceNew) The ID of the VPC."
  type        = string
  default     = ""
}

variable "transit_router_attachment_name" {
  description = "The name of the transit router vpc attachment."
  type        = string
  default     = ""
}

variable "transit_router_attachment_description" {
  description = "The description of the transit router vpc attachment."
  type        = string
  default     = ""
}

variable "zone_mappings" {
  description = "(Required, ForceNew) The list of zone mapping of the VPC."
  type        = list(map(string))
  default     = []
}

#################
# Route Entry
#################
variable "create_route_entry" {
  description = "Controls if route entry should be created."
  type        = bool
  default     = false
}

variable "transit_router_route_entry_destination_cidr_block" {
  description = "(Required, ForceNew) The CIDR of the transit router route entry."
  type        = string
  default     = ""
}

variable "transit_router_route_entry_next_hop_type" {
  description = "(Required, ForceNew) The Type of the transit router route entry next hop,Valid values Attachment and BlackHole."
  type        = string
  default     = "Attachment"
  validation {
    condition     = contains(["Attachment", "BlackHole"], var.transit_router_route_entry_next_hop_type)
    error_message = "Allowed values is Attachment or BlackHole."
  }
}

variable "transit_router_route_entry_name" {
  description = "The name of the transit router route entry."
  type        = string
  default     = ""
}

variable "transit_router_route_entry_description" {
  description = "The description of the transit router route entry."
  type        = string
  default     = ""
}

variable "transit_router_route_entry_next_hop_id" {
  description = "(Required, ForceNew) The ID of the transit router route entry next hop."
  type        = string
  default     = ""
}

#################
# Route Map
#################
variable "create_route_map" {
  description = "Controls if route map should be created"
  type        = bool
  default     = false
}

variable "cen_region_id" {
  description = "(Required) The ID of the region to which the CEN instance belongs."
  type        = string
  default     = ""
}

variable "route_map_description" {
  description = "The description of the route map."
  type        = string
  default     = ""
}

variable "priority" {
  description = "(Required) The priority of the route map. Value range: 1 to 100. A lower value indicates a higher priority."
  type        = number
  default     = null
}

variable "transmit_direction" {
  description = "(Required, ForceNew) The direction in which the route map is applied. Valid values: RegionIn, RegionOut]."
  type        = string
  default     = "RegionIn"

  validation {
    condition     = contains(["RegionIn", "RegionOut"], var.transmit_direction)
    error_message = "Allowed values is RegionIn or RegionOut."
  }
}

variable "map_result" {
  description = "(Required) The action that is performed to a route if the route matches all the match conditions. Valid values: Permit, Deny."
  type        = string
  default     = "Permit"

  validation {
    condition     = contains(["Permit", "Deny"], var.map_result)
    error_message = "Allowed values is Permit or Deny."
  }
}

variable "source_region_ids" {
  description = "A match statement that indicates the list of IDs of the source regions. You can enter a maximum of 32 region IDs."
  type        = list(string)
  default     = []
}
