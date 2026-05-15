resource "aws_instance" "mlops" {
  ami                         = var.server_ami_id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  subnet_id                   = var.vpc_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
}