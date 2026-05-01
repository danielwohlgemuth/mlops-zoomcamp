resource "aws_vpc" "mlops" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_ec2_tag" "mlops_route_table_name_tag" {
  resource_id = aws_vpc.mlops.default_route_table_id
  key         = "Name"
  value       = "mlops"
}

resource "aws_ec2_tag" "mlops_security_group_name_tag" {
  resource_id = aws_vpc.mlops.default_security_group_id
  key         = "Name"
  value       = "mlops"
}

resource "aws_subnet" "mlops" {
  vpc_id     = aws_vpc.mlops.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_route_table_association" "mlops" {
  subnet_id      = aws_subnet.mlops.id
  route_table_id = aws_vpc.mlops.default_route_table_id
}

resource "aws_internet_gateway" "mlops" {
  vpc_id = aws_vpc.mlops.id
}

resource "aws_route" "mlops" {
  route_table_id         = aws_vpc.mlops.default_route_table_id
  gateway_id             = aws_internet_gateway.mlops.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "mlops_ipv4" {
  count             = var.my_ip_v4 != null ? 1 : 0
  security_group_id = aws_vpc.mlops.default_security_group_id
  ip_protocol       = "tcp"
  from_port         = "22"
  to_port           = "22"
  cidr_ipv4         = "${var.my_ip_v4}/32"
}

data "aws_ec2_managed_prefix_list" "mlops" {
  name = "com.amazonaws.${var.aws_region}.ec2-instance-connect"
}

resource "aws_vpc_security_group_ingress_rule" "mlops_instance_connect" {
  security_group_id = aws_vpc.mlops.default_security_group_id
  ip_protocol       = "tcp"
  from_port         = "22"
  to_port           = "22"
  prefix_list_id    = data.aws_ec2_managed_prefix_list.mlops.id
}

resource "aws_vpc_endpoint" "mlops" {
  vpc_id       = aws_vpc.mlops.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "mlops" {
  route_table_id  = aws_vpc.mlops.default_route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.mlops.id
}

resource "aws_vpc_endpoint_policy" "mlops" {
  vpc_endpoint_id = aws_vpc_endpoint.mlops.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowS3",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Resource" : "${var.s3_arn}/*"
      }
    ]
  })
}