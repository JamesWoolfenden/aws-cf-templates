resource "aws_rds_cluster" "DatabaseCluster" {
  iam_database_authentication_enabled=false
  engine                  = "aurora"
  engine_version          = ""
  availability_zones      = []
  database_name           = "wordpress"
  master_username         = "wordpress"
  master_password         = "wordpress"
  backup_retention_period = 30
  allow_major_version_upgrade     = false
  enabled_cloudwatch_logs_exports=[]
  enable_http_endpoint=false
  deletion_protection=false
  storage_encrypted=false
  vpc_security_group_ids=[]
  iam_roles=[]
  copy_tags_to_snapshot=false
}
