Terraform module which creates CEN Transit Router resources on Alibaba Cloud.

terraform-alicloud-cen-transit-router
=====================================================================

[English](https://github.com/terraform-alicloud-modules/terraform-alicloud-cen-transit-router/blob/main/README.md) | 简体中文

本 Module 用于自动化管理网络版实例路由，包括路由转发、路由策略等，包含：`CEN`。

本 Module 支持创建以下资源:

* [alicloud_cen_transit_router](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router)
* [alicloud_cen_transit_router_route_table](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router_route_table)
* [alicloud_cen_transit_router_vpc_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router_vpc_attachment)
* [alicloud_cen_transit_router_route_entry](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_transit_router_route_entry)
* [alicloud_cen_route_map](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cen_route_map)

## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Acen-transit-router&spm=docs.m.terraform-alicloud-modules.cen-transit-router" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

```hcl
module "example" {
  source                                 = "terraform-alicloud-modules/cen-transit-router/alicloud"
  #alicloud_cen_transit_router
  create_transit_router                  = true
  transit_router_name                    = "tf-test-transit-router"
  transit_router_description             = "tf-test-transit-router"
  cen_id                                 = "your_cen_id"
  #alicloud_cen_transit_router_route_table
  create_route_table                     = true
  transit_router_route_table_name        = "tf-test-route-table"
  transit_router_route_table_description = "tf-test-route-table"
  #alicloud_cen_transit_router_vpc_attachment
  create_vpc_attachment                 = true
  vpc_id                                = "your_vpc_id"
  transit_router_attachment_name        = "tf-test-vpc-attachment"
  transit_router_attachment_description = "tf-test-vpc-attachment"
  zone_mappings                         = [{ zone_id : "cn-hangzhou-h", vswitch_id : your_master_vswitch_id }, { zone_id : "cn-hangzhou-i", vswitch_id : your_slave_vswitch_id }]
  #alicloud_cen_transit_router_route_entry
  create_route_entry                                = true
  transit_router_route_entry_destination_cidr_block = "192.168.0.0/24"
  transit_router_route_entry_next_hop_type          = "Attachment"
  transit_router_route_entry_name                   = "tf-test-route-entry"
  transit_router_route_entry_description            = "tf-test-route-entry"
  #alicloud_cen_route_map
  create_route_map                       = true
  cen_region_id                          = "cn-hangzhou"
  route_map_description                  = "tf-test-route-map"
  priority                               = 1
  transmit_direction                     = "RegionIn"
  map_result                             = "Permit"
  source_region_ids                      = ["cn-beijing"]
}
```

## 示例

* [CEN 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-cen-transit-router/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.126.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.126.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
