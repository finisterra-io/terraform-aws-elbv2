resource "aws_lb" "default" {
  count                  = var.enabled ? 1 : 0
  name                   = var.load_balancer_name == "" ? null : substr(var.load_balancer_name, 0, var.load_balancer_name_max_length)
  tags                   = var.tags
  internal               = var.internal
  load_balancer_type     = var.load_balancer_type
  enable_xff_client_port = var.enable_xff_client_port

  security_groups = var.security_groups

  subnets = coalesce(var.subnet_ids, data.aws_subnet.default[*].id, [])

  enable_cross_zone_load_balancing = var.cross_zone_load_balancing_enabled
  enable_http2                     = var.http2_enabled
  idle_timeout                     = var.idle_timeout
  ip_address_type                  = var.ip_address_type
  enable_deletion_protection       = var.deletion_protection_enabled
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  preserve_host_header             = var.preserve_host_header
  xff_header_processing_mode       = var.xff_header_processing_mode

  dynamic "access_logs" {
    for_each = length(var.access_logs) > 0 ? [var.access_logs] : []

    content {
      enabled = try(access_logs.value.enabled, try(access_logs.value.bucket, null) != null)
      bucket  = try(access_logs.value.bucket, null)
      prefix  = try(access_logs.value.prefix, null)
    }
  }

}

resource "aws_lb_listener" "this" {
  for_each = var.aws_lb_listeners

  load_balancer_arn = one(aws_lb.default[*].arn)

  alpn_policy = var.alpn_policy

  port            = each.value.port
  protocol        = each.value.protocol
  ssl_policy      = try(each.value.ssl_policy, null)
  certificate_arn = try(each.value.certificate_arn, null)
  tags            = try(each.value.tags, null)

  dynamic "default_action" {
    for_each = length(each.value.default_action) > 0 ? each.value.default_action : []

    content {
      order            = try(default_action.value.order, null)
      target_group_arn = try(default_action.value.target_group_arn, null)
      type             = try(default_action.value.type, null)
      dynamic "authenticate_cognito" {
        for_each = try(default_action.value.authenticate_cognito, [])
        content {
          authentication_request_extra_params = try(authenticate_cognito.value.authentication_request_extra_params, null)
          on_unauthenticated_request          = try(authenticate_cognito.value.on_unauthenticated_request, null)
          scope                               = try(authenticate_cognito.value.scope, null)
          session_cookie_name                 = try(authenticate_cognito.value.session_cookie_name, null)
          session_timeout                     = try(authenticate_cognito.value.session_timeout, null)
          user_pool_arn                       = try(authenticate_cognito.value.user_pool_arn, null)
          user_pool_client_id                 = try(authenticate_cognito.value.user_pool_client_id, null)
          user_pool_domain                    = try(authenticate_cognito.value.user_pool_domain, null)
        }
      }
      dynamic "authenticate_oidc" {
        for_each = try(default_action.value.authenticate_oidc, [])
        content {
          authentication_request_extra_params = try(authenticate_oidc.value.authentication_request_extra_params, null)
          authorization_endpoint              = try(authenticate_oidc.value.authorization_endpoint, null)
          client_id                           = try(authenticate_oidc.value.client_id, null)
          client_secret                       = try(authenticate_oidc.value.client_secret, null)
          issuer                              = try(authenticate_oidc.value.issuer, null)
          on_unauthenticated_request          = try(authenticate_oidc.value.on_unauthenticated_request, null)
          scope                               = try(authenticate_oidc.value.scope, null)
          session_cookie_name                 = try(authenticate_oidc.value.session_cookie_name, null)
          session_timeout                     = try(authenticate_oidc.value.session_timeout, null)
          token_endpoint                      = try(authenticate_oidc.value.token_endpoint, null)
          user_info_endpoint                  = try(authenticate_oidc.value.user_info_endpoint, null)
        }
      }
      dynamic "fixed_response" {
        for_each = try(default_action.value.fixed_response, [])
        content {
          content_type = try(fixed_response.value.content_type, null)
          message_body = try(fixed_response.value.message_body, null)
          status_code  = try(fixed_response.value.status_code, null)
        }
      }
      dynamic "forward" {
        for_each = try(default_action.value.forward, [])
        content {
          dynamic "target_group" {
            for_each = try(forward.value.target_group, [])
            content {
              arn    = try(target_group.value.arn, null)
              weight = try(target_group.value.weight, null)
            }
          }

          dynamic "stickiness" {
            for_each = try(forward.value.stickiness, [])
            content {
              duration = try(stickiness.value.duration, null)
              enabled  = try(stickiness.value.enabled, null)
            }
          }
        }
      }
      dynamic "redirect" {
        for_each = try(default_action.value.redirect, [])
        content {
          host        = try(redirect.value.host, null)
          path        = try(redirect.value.path, null)
          port        = try(redirect.value.port, null)
          protocol    = try(redirect.value.protocol, null)
          query       = try(redirect.value.query, null)
          status_code = try(redirect.value.status_code, null)
        }
      }
    }
  }

}
