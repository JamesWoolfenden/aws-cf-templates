resource "aws_backup_plan" "BackupPlan" {
  name = "BackupPlan"
  rule {
    rule_name         = "goformation-stack"
    target_vault_name = ""
    schedule          = "cron(0 4 ? * * *)"
    enable_continuous_backup=false
    start_window      = 60
    completion_window = 1440
    lifecycle {
      delete_after = 30
    }
    recovery_point_tags= {
    }
  }
}
