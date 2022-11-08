resource "aws_db_instance" "Database" {
  allocated_storage    = 5
  allow_major_version_upgrade= false
  auto_minor_version_upgrade= false
  db_name              = "wordpress"
  engine               = "MySQL"
  engine_version       = ""
  instance_class       = "db.t3.micro"
  username             = "wordpress"
  password             = "wordpress"
  backup_retention_period= 30
  copy_tags_to_snapshot=false
  delete_automated_backups= false
  deletion_protection= false
  enabled_cloudwatch_logs_exports=[]
  iam_database_authentication_enabled= false
  performance_insights_enabled= false
  multi_az= true
  publicly_accessible= false
  storage_encrypted = false
  vpc_security_group_ids=[aws_security_group.DatabaseSecurityGroup.id]
}

