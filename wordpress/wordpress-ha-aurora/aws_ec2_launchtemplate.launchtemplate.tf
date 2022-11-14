resource "aws_launch_template" "LaunchTemplate" {
  name = "LaunchTemplate"
  block_device_mappings {
    ebs {
    }
    no_device=""
    virtual_name=""
    device_name = "/dev/xvda"
  }
  disable_api_stop        = false
  disable_api_termination = false
  ebs_optimized           = false
  iam_instance_profile {
    arn  = ""
  }
  image_id =  "ami-0c4e4b4eb2e11d1d4"
  instance_type = "t3.micro"
  kernel_id = ""
  key_name = ""
  metadata_options {
    http_tokens                 = "required"
  }
  network_interfaces {
    associate_public_ip_address = true
  }
  ram_disk_id = ""
  vpc_security_group_ids = []
  user_data = <<-EOF
#!/bin/bash -ex
trap '/opt/aws/bin/cfn-signal -e 1 --stack goformation-stack --resource AutoScalingGroup --region us-east-1' ERR
/opt/aws/bin/cfn-init -v --stack goformation-stack --resource LaunchTemplate --region us-east-1
/opt/aws/bin/cfn-signal -e 0 --stack goformation-stack --resource AutoScalingGroup --region us-east-1

EOF
}
