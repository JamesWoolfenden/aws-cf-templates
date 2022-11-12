resource "aws_launch_template" "LaunchTemplate" {
  name = "<nil>"
  block_device_mappings {
    ebs {
      volume_size=<nil>
    }
    no_device=""
    virtual_name=""
    device_name = "/dev/xvda"
  }
  disable_api_stop        = false
  disable_api_termination = false
  ebs_optimized           = false
  iam_instance_profile {
    name = 