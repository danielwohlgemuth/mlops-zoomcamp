resource "aws_vpc" "mlops" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mlops"
  }
}

resource "aws_ec2_tag" "mlops_route_table_name_tag" {
  resource_id = aws_vpc.mlops.default_route_table_id
  key         = "Name"
  value       = "mlops"
}

resource "aws_ec2_tag" "security_group_name_tag" {
  resource_id = aws_vpc.mlops.default_security_group_id
  key         = "Name"
  value       = "mlops"
}

resource "aws_subnet" "mlops" {
  vpc_id     = aws_vpc.mlops.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "mlops"
  }
}

resource "aws_route_table_association" "mlops" {
  subnet_id      = aws_subnet.mlops.id
  route_table_id = aws_vpc.mlops.default_route_table_id
}

resource "aws_internet_gateway" "mlops" {
  vpc_id = aws_vpc.mlops.id

  tags = {
    Name = "mlops"
  }
}

resource "aws_route" "mlops" {
  route_table_id         = aws_vpc.mlops.default_route_table_id
  gateway_id             = aws_internet_gateway.mlops.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_security_group_rule" "mlops_ipv4" {
  count             = var.my_ip_v4 != null ? 1 : 0
  security_group_id = aws_vpc.mlops.default_security_group_id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "22"
  to_port           = "22"
  cidr_blocks       = ["${var.my_ip_v4}/32"]
}

resource "aws_vpc_endpoint" "mlops" {
  vpc_id       = aws_vpc.mlops.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  tags = {
    Name = "mlops"
  }
}

resource "aws_vpc_endpoint_route_table_association" "mlops" {
  route_table_id  = aws_vpc.mlops.default_route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.mlops.id
}