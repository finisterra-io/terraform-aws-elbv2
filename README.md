
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | A boolean flag to enable/disable access\_logs | `map(any)` | `{}` | no |
| <a name="input_aws_lb_listeners"></a> [aws\_lb\_listeners](#input\_aws\_lb\_listeners) | A map of listener configurations where the key is the port number | `any` | `[]` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Enables the security group | `bool` | `false` | no |
| <a name="input_cross_zone_load_balancing_enabled"></a> [cross\_zone\_load\_balancing\_enabled](#input\_cross\_zone\_load\_balancing\_enabled) | A boolean flag to enable/disable cross zone load balancing | `bool` | `true` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | A boolean flag to enable/disable deletion protection for ALB | `bool` | `false` | no |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). | `bool` | `false` | no |
| <a name="input_enable_xff_client_port"></a> [enable\_xff\_client\_port](#input\_enable\_xff\_client\_port) | Enables the X-Forwarded-For, X-Forwarded-Proto, and X-Forwarded-Port headers | `bool` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean flag to enable/disable the ALB module | `bool` | `true` | no |
| <a name="input_http2_enabled"></a> [http2\_enabled](#input\_http2\_enabled) | A boolean flag to enable/disable HTTP/2 | `bool` | `true` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | A boolean flag to determine whether the ALB should be internal | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | `string` | `"ipv4"` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | The name for the default load balancer, uses a module label name if left empty | `string` | `""` | no |
| <a name="input_load_balancer_name_max_length"></a> [load\_balancer\_name\_max\_length](#input\_load\_balancer\_name\_max\_length) | The max length of characters for the load balancer. | `number` | `32` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | The type of load balancer to create. Possible values are `application` or `network` | `string` | n/a | yes |
| <a name="input_preserve_host_header"></a> [preserve\_host\_header](#input\_preserve\_host\_header) | Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. | `bool` | `false` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group to be associated with the replication group | `string` | `null` | no |
| <a name="input_security_group_names"></a> [security\_group\_names](#input\_security\_group\_names) | A list of additional security group names to allow access to ALB | `list(string)` | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of additional security group ids to allow access to ALB | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to associate with ALB | `list(string)` | `null` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names for the default subnets, uses a module label name if left empty | `list(any)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to associate with ALB | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name for the default vpc, uses a module label name if left empty | `string` | `""` | no |
| <a name="input_xff_header_processing_mode"></a> [xff\_header\_processing\_mode](#input\_xff\_header\_processing\_mode) | Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request before sending the request to the target. The possible values are append, preserve, and remove. Only valid for Load Balancers of type application. The default is append | `string` | `"append"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_arn_suffix"></a> [alb\_arn\_suffix](#output\_alb\_arn\_suffix) | The ARN suffix of the ALB |
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | DNS name of ALB |
| <a name="output_alb_name"></a> [alb\_name](#output\_alb\_name) | The ARN suffix of the ALB |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | The ID of the zone which ALB is provisioned |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the ALB |
| <a name="output_listeners"></a> [listeners](#output\_listeners) | The list of listener blocks of the ALB |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
