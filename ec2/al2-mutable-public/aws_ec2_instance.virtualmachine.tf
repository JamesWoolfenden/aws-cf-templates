resource "aws_instance" "VirtualMachine" {
  launch_template="<nil>"
  instance_type="t3.nano"
  user_data=<<-EOF
#!/bin/bash -ex
trap '/opt/aws/bin/cfn-signal -e 1 --region us-east-1 --stack goformation-stack --resource VirtualMachine' ERR

/opt/aws/bin/cfn-init -v --stack goformation-stack --resource VirtualMachine --region us-east-1
/opt/aws/bin/cfn-signal -e 0 --region us-east-1 --stack goformation-stack --resource VirtualMachine

EOF

  ebs_block_device {
    delete_on_termination=false
    device_name="/dev/xvda"
    encrypted=false
    volume_size=8
    volume_type="gp2"
  }
  disable_api_stop= false
  ebs_optimized = false
  monitoring = false
  network_interface {
    delete_on_termination= false
    device_index         = 0
    network_interface_id = ""
  }
  tags = {
  	"Name"="test"

    }
}
