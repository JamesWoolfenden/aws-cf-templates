variable "ParentClientStack1" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the EC2 instance to whatever uses the client security group."
}
variable "RestoreImageId" {
  type   = string
  default= ""
  description= "Restore from existing Amazon Machine Image (AMI)."
}
variable "ParentVPCStack" {
  type   = string
  default= null
  description= "Stack name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
variable "ParentZoneStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent zone stack based on vpc/zone-*.yaml template."
}
variable "IngressTcpParentClientStack2" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml that is required to access IngressTcpPort2 (if you leave this blank, IngressTcpPort2 is open to the world 0.0.0.0/0)."
}
variable "IngressTcpPort1" {
  type   = number
  default= 0
  description= "Optional port allowing ingress TCP traffic."
}
variable "LogsRetentionInDays" {
  type   = number
  default= 14
  description= "Specifies the number of days you want to retain log events."
}
variable "MaintenanceWindowSchedule" {
  type   = string
  default= "cron(0 5 ? * SUN *)"
  description= "SSM cron expressions to trigger the maintenace window for patch installation (leave empty to disable)."
}
variable "Name" {
  type   = string
  default= "test"
  description= "The name for the EC2 instance."
}
variable "ParentSSHBastionStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent SSH bastion host/instance stack based on vpc/vpc-*-bastion.yaml template."
}
variable "SubDomainNameWithDot" {
  type   = string
  default= ""
  description= "Name that is used to create the DNS entry with trailing dot, e.g. §{SubDomainNameWithDot}§{HostedZoneName}. Leave blank for naked (or apex and bare) domain. Requires ParentZoneStack parameter!"
}
variable "AmazonLinux2Version" {
  type   = string
  default= null
  description= "Version of Amazon Linux 2 to boot from the first time (ignored if RestoreImageId is set; select the latest version for new stacks; OS updates are enabled to patch the system)."
}
variable "IngressTcpPort3" {
  type   = number
  default= 0
  description= "Optional port allowing ingress TCP traffic."
}
variable "ParentAlertStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent alert stack based on operations/alert.yaml template."
}
variable "PermissionsBoundary" {
  type   = string
  default= ""
  description= "Optional ARN for a policy that will be used as the permission boundary for all roles created by this template."
}
variable "UserData" {
  type   = string
  default= ""
  description= "Optional Bash script executed on first instance launch."
}
variable "KeyName" {
  type   = string
  default= ""
  description= "Optional key pair of the ec2-user to establish a SSH connection to the EC2 instance."
}
variable "BackupRetentionPeriod" {
  type   = number
  default= 30
  description= "The number of days to keep backups of the EC2 instance (set to 0 to disable)."
}
variable "InstanceType" {
  type   = string
  default= "t3.nano"
  description= "The instance type for the EC2 instance."
}
variable "ParentClientStack3" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the EC2 instance to whatever uses the client security group."
}
variable "RootVolumeSize" {
  type   = number
  default= 8
  description= "The root volume size, in Gibibytes (GiB) (if RestoreImageId is set, value must be >= snapshot of AMI)."
}
variable "SubnetName" {
  type   = string
  default= "SubnetAPublic"
  description= "Subnet name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
variable "BackupScheduleExpression" {
  type   = string
  default= "cron(0 4 ? * * *)"
  description= "A CRON expression specifying when AWS Backup initiates a backup job."
}
variable "MaintenanceWindowScheduleTimezone" {
  type   = string
  default= "UTC"
  description= "Timezone for maintenance window schedule (in IANA format)."
}
variable "ParentKmsKeyStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent KMS key stack based on security/kms-key.yaml template."
}
variable "IAMUserSSHAccess" {
  type   = bool
  default= false
  description= "Synchronize public keys of IAM users to enable personalized SSH access (Doc: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/)."
}
variable "IngressTcpParentClientStack3" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml that is required to access IngressTcpPort3 (if you leave this blank, IngressTcpPort3 is open to the world 0.0.0.0/0)."
}
variable "IngressTcpPort2" {
  type   = number
  default= 0
  description= "Optional port allowing ingress TCP traffic."
}
variable "IngressTcpParentClientStack1" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml that is required to access IngressTcpPort1 (if you leave this blank, IngressTcpPort1 is open to the world 0.0.0.0/0)."
}
variable "ManagedPolicyArns" {
  type   = string
  default= ""
  description= "Optional comma-delimited list of IAM managed policy ARNs to attach to the instance's IAM role."
}
variable "ParentClientStack2" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the EC2 instance to whatever uses the client security group."
}
