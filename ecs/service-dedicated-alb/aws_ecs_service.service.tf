resource "aws_ecs_service" "Service" {
  name            = "Service"
  cluster         = ""
  desired_count   = 2
  enable_ecs_managed_tags=false
  iam_role        = ""
  load_balancer {
    container_name= "main"
    container_port= 80
    elb_name      = ""
    target_group_arn= ""
  }
  task_definition=""
  enable_execute_command = false
  health_check_grace_period_seconds = 60

  ordered_placement_strategy {
    field= "attribute:ecs.availability-zone"
    type = "spread"
  }
  ordered_placement_strategy {
    field= "instanceId"
    type = "spread"
  }
}
