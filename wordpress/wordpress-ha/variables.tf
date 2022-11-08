variable "ParentVPCStack" {
  type   = string
  default= null
  description= "Stack name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
variable "ParentWAFStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent WAF stack based on the security/waf.yaml template."
}
variable "WebServerKeyName" {
  type   = string
  default= ""
  description= "Optional key pair of the ec2-user to establish a SSH connection to the web server."
}
variable "CloudFrontAcmCertificate" {
  type   = string
  default= null
  description= "The ACM Certificate ARN for the CloudFront distribution. Must be created in the us-east-1 region!"
}
variable "DBBackupRetentionPeriod" {
  type   = number
  default= 30
  description= "The number of days to keep snapshots of the database."
}
variable "DBServerInstanceType" {
  type   = string
  default= "db.t3.micro"
  description= "The instance type of database server (e.g. db.t3.micro)."
}
variable "WebServerSystemsManagerAccess" {
  type   = bool
  default= true
  description= "Enable AWS Systems Manager agent and authorization."
}
variable "BlogTitle" {
  type   = string
  default= "Just another WordPress blog"
  description= "The title of the WordPress blog."
}
variable "ElbAcmCertificate" {
  type   = string
  default= null
  description= "The ACM Certificate ARN for the ELB. Must be created in the same region as this stack!"
}
variable "LoadBalancerIdleTimeout" {
  type   = number
  default= 60
  description= "The idle timeout value, in seconds."
}
variable "ManagedPolicyArns" {
  type   = string
  default= ""
  description= "Optional comma-delimited list of IAM managed policy ARNs to attach to the instance's IAM role"
}
variable "BlogAdminEMail" {
  type   = string
  default= null
  description= "The email address of the WordPress admin."
}
variable "ParentS3StackAccessLog" {
  type   = string
  default= ""
  description= "Optional stack name of parent s3 stack based on state/s3.yaml template (with Access set to ElbAccessLogWrite) to store access logs."
}
variable "ParentZoneStack" {
  type   = string
  default= null
  description= "Stack name of parent zone stack based on vpc/zone-*.yaml template."
}
variable "WebServerInstanceType" {
  type   = string
  default= "t3.micro"
  description= "The instance type of web servers (e.g. t3.micro)."
}
variable "ParentSSHBastionStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent SSH bastion host/instance stack based on vpc/vpc-*-bastion.yaml template."
}
variable "DBMasterUserPassword" {
  type   = string
  default= "wordpress"
  description= "The master password for the DB instance. Must not be changed!"
}
variable "ParentAlertStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent alert stack based on operations/alert.yaml template."
}
variable "SubDomainNameWithDot" {
  type   = string
  default= "www."
  description= "Name that is used to create the DNS entry with trailing dot, e.g. §{SubDomainNameWithDot}§{HostedZoneName}. Leave blank for naked (or apex and bare) domain."
}
variable "WebServerLogsRetentionInDays" {
  type   = number
  default= 14
  description= "Specifies the number of days you want to retain log events."
}
variable "BlogAdminPassword" {
  type   = string
  default= null
  description= "A password for the WordPress admin."
}
variable "BlogAdminUsername" {
  type   = string
  default= "admin"
  description= "A username for the WordPress admin."
}
variable "EFSBackupRetentionPeriod" {
  type   = number
  default= 30
  description= "The number of days to keep backups of the EFS file system (set to 0 to disable)."
}
variable "EFSBackupScheduleExpression" {
  type   = string
  default= "cron(0 5 ? * * *)"
  description= "A CRON expression specifying when AWS Backup initiates a backup job."
}
variable "PermissionsBoundary" {
  type   = string
  default= ""
  description= "Optional ARN for a policy that will be used as the permission boundary for all roles created by this template."
}
variable "WebServerIAMUserSSHAccess" {
  type   = bool
  default= false
  description= "Synchronize public keys of IAM users to enable personalized SSH access (Doc: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/)."
}
variable "EFSProvisionedThroughputInMibps" {
  type   = number
  default= 0
  description= "The provisioned throughput for the Elastic File System (EFS) in Mibps. Default is 0 which enables the bursting mode and disables provisioned throughput."
}

variable "vpc_id" {
  type=string
  default=""
}

variable "HostedZoneName" {
  type=string
  default="sato"
}

variable "zone_id" {
  type=string
  default="Z0613304D03LG1SU5BI"
}