resource "aws_ssm_maintenance_window" "MaintenanceWindow" {
  name     = "goformation-stack"
  schedule = "cron(0 5 ? * SUN *)"
  duration = 2
  cutoff   = 1
  description               = ""
  allow_unassociated_targets= false
  end_date                  = ""
  schedule_timezone         = "cron(0 5 ? * SUN *)"
  start_date                = ""
}
