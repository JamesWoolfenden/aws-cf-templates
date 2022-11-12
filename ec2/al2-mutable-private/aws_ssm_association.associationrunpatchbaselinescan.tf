resource "aws_ssm_association" "AssociationRunPatchBaselineScan" {
  name = "AWS-RunPatchBaseline"
  apply_only_at_cron_interval=false
  association_name="<nil>"