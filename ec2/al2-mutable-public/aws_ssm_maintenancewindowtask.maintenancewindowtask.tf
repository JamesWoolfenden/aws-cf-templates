resource "aws_ssm_maintenance_window_task" "MaintenanceWindowTask" {
  name            = "MaintenanceWindowTask"
  max_concurrency = 1
  max_errors      = 1
  cutoff_behavior = ""
  description     = ""
  priority        = 0
  task_arn        = "AWS-RunPatchBaseline"
  task_type       = "RUN_COMMAND"
  window_id       = ""
  service_role_arn= ""
  targets {
    key    = "WindowTargetIds"
    values = []
  }
  task_invocation_parameters {
    run_command_parameters   {
      comment            = ""
      document_hash      = ""
      document_hash_type = ""
      document_version   = ""
      output_s3_bucket   = ""
      output_s3_key_prefix= ""
      parameter   {
         name  = "Operation"
         values=  ["Install",]
      }
      service_role_arn    = ""
    }
  }
}
