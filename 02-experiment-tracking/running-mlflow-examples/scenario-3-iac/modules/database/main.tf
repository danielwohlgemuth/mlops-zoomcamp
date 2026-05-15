resource "aws_db_subnet_group" "mlops" {
  name       = "main"
  subnet_ids = [var.vpc_subnet_id_1, var.vpc_subnet_id_2]
}

resource "aws_db_instance" "mlops" {
  db_name                = var.db_name
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  allocated_storage      = var.db_storage
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.mlops.name
  skip_final_snapshot    = true
  # backup_retention_period  = 1
  # delete_automated_backups = false
}