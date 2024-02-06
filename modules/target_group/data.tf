data "aws_vpc" "default" {
  count = var.vpc_name != null ? 1 : 0
  tags = {
    Name = var.vpc_name
  }
}
