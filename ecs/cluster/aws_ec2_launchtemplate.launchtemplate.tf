resource "aws_launch_template" "LaunchTemplate" {
  name = "LaunchTemplate"
  block_device_mappings {
    ebs {
    }
    no_device    = ""
    virtual_name = ""
    device_name  = "/dev/xvda"
  }
  disable_api_stop        = false
  disable_api_termination = false
  ebs_optimized           = false
  iam_instance_profile {
    arn = aws_iam_instance_profile.InstanceProfile.arn
  }
  image_id      = "ami-00eb90638788e810f"
  instance_type = "t2.micro"
  kernel_id     = ""
  key_name      = ""
  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }
  ram_disk_id            = ""
  vpc_security_group_ids = [aws_security_group.SecurityGroup.id]
  user_data              = <<-EOF
#!/bin/bash -ex
trap '/opt/aws/bin/cfn-signal -e 1 --stack goformation-stack --resource AutoScalingGroup --region us-east-1' ERR
echo "ECS_CLUSTER=" >> /etc/ecs/ecs.config
echo "ECS_CONTAINER_STOP_TIMEOUT=${var.StopContainerTimeoutInSeconds}s" >> /etc/ecs/ecs.config
echo "ECS_ALLOW_OFFHOST_INTROSPECTION_ACCESS=true" >> /etc/ecs/ecs.config
yum install -y aws-cfn-bootstrap
/opt/aws/bin/cfn-init -v --stack goformation-stack --resource LaunchTemplate --region us-east-1
/opt/aws/bin/cfn-signal -e 0 --stack goformation-stack --resource AutoScalingGroup --region us-east-1

EOF
}
