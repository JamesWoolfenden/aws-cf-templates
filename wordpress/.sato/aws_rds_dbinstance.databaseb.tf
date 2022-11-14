resource "aws_db_instance" "DatabaseB" {
  allow_major_version_upgrade= false
  auto_minor_version_upgrade= false
  db_name              = ""
  engine               = "aurora"
  engine_version       = ""
  instance_class       = "db.t2.small"
  username             = ""
  password             = ""
  copy_tags_to_snapshot=false
  delete_automated_backups= false
  deletion_protection= false
  enabled_cloudwatch_logs_exports=[]
  iam_database_authentication_enabled= false
  performance_insights_enabled= false
  multi_az= false
  publicly_accessible= false
  storage_encrypted = false
  vpc_security_group_ids=[]
}
