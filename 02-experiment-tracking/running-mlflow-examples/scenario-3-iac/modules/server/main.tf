data "aws_ami" "mlops" {
  most_recent = true
  owners      = ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "mlops" {
  ami                         = data.aws_ami.mlops.id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  subnet_id                   = var.vpc_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
}