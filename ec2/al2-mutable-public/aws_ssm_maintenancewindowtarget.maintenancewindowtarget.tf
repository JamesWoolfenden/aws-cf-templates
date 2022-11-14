resource "aws_ssm_maintenance_window_target" "MaintenanceWindowTarget" {
  window_id     = ""
  name          = "MaintenanceWindowTarget"
  description   = ""
  resource_type = "INSTANCE"
  owner_information= ""
  targets {
    key    = "InstanceIds"
    values = []
  }
}
