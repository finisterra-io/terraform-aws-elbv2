# target_group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Determines if is created | `bool` | `true` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | The amount of time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds | `number` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check configuration for the target group | `map(any)` | <pre>{<br>  "enabled": true,<br>  "healthy_threshold": 3,<br>  "interval": 30,<br>  "path": "/",<br>  "port": "traffic-port",<br>  "protocol": "HTTP",<br>  "timeout": 5,<br>  "unhealthy_threshold": 3<br>}</pre> | no |
| <a name="input_listener_rules"></a> [listener\_rules](#input\_listener\_rules) | List of listener rules to create on the load balancer | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to use on target group created | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Port to use on target group created | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol to use on target group created | `string` | `"HTTP"` | no |
| <a name="input_stickiness"></a> [stickiness](#input\_stickiness) | Stickiness configuration for the target group | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional tags to add to the target group created | `map(string)` | `{}` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | The type of target that you must specify when registering targets with this target group. The possible values are `instance` (targets are specified by instance ID) or `ip` (targets are specified by IP address). The default is `ip` | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC to use | `string` | `null` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to use | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the target group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
