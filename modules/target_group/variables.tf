variable "create" {
  description = "Determines if is created"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to use on target group created"
  type        = string
  default     = null
}

variable "port" {
  description = "Port to use on target group created"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol to use on target group created"
  type        = string
  default     = "HTTP"
}

variable "health_check" {
  description = "Health check configuration for the target group"
  type        = map(any)
  default = {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }
}

variable "stickiness" {
  description = "Stickiness configuration for the target group"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "A map of additional tags to add to the target group created"
  type        = map(string)
  default     = {}
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group. The possible values are `instance` (targets are specified by instance ID) or `ip` (targets are specified by IP address). The default is `ip`"
  type        = string
  default     = null
}

variable "deregistration_delay" {
  description = "The amount of time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds"
  type        = number
  default     = null
}

variable "vpc_name" {
  description = "Name of the VPC to use"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC to use"
  type        = string
  default     = null
}

variable "listener_rules" {
  description = "List of listener rules to create on the load balancer"
  type        = map(any)
  default     = {}
}

variable "proxy_protocol_v2" {
  description = "If true, the connection between the load balancer and the targets uses the Proxy Protocol version 2"
  type        = bool
  default     = false
}

variable "slow_start" {
  description = "The time period, in seconds, during which a newly registered target receives a linearly increasing share of the traffic to the target group. After this time period ends, the target receives its full share of the traffic. The range is 30-900 seconds (15 minutes). Slow start mode is disabled by default"
  type        = number
  default     = null
}

variable "lambda_multi_value_headers_enabled" {
  description = "If true, the request headers are passed to the targets as is. If false, the headers are converted to lowercase before they are sent to the targets"
  type        = bool
  default     = false
}
