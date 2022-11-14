variable "SubnetsReach" {
  type   = string
  default= "Public"
  description= "Should the cluster have direct access to the Internet or do you prefer private subnets with NAT?"
}
variable "LoadBalancerIdleTimeout" {
  type   = number
  default= 60
  description= "The idle timeout value, in seconds."
}
variable "ParentClientStack1" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}
variable "ParentVPCStack" {
  type   = string
  default= null
  description= "Stack name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
variable "ManagedPolicyArns" {
  type   = string
  default= ""
  description= "Optional comma-delimited list of IAM managed policy ARNs to attach to the instance's IAM role"
}
variable "MaxSize" {
  type   = number
  default= 4
  description= "The maximum size of the Auto Scaling group."
}
variable "MinSize" {
  type   = number
  default= 2
  description= "The minimum size of the Auto Scaling group."
}
variable "ParentS3StackAccessLog" {
  type   = string
  default= ""
  description= "Optional stack name of parent s3 stack based on state/s3.yaml template (with Access set to ElbAccessLogWrite) to store access logs."
}
variable "MaxSize" {
  type   = number
  default= 4
  description= "The maximum size of the Auto Scaling group."
}
variable "ParentAuthProxyStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent auth proxy stack based on security/auth-proxy-*.yaml template."
}
variable "StopContainerTimeoutInSeconds" {
  type   = number
  default= 30
  description= "Time in seconds the ECS agent waits before killing a stopped container (see ECS_CONTAINER_STOP_TIMEOUT)."
}
variable "DrainingTimeoutInSeconds" {
  type   = number
  default= 600
  description= "Maximum time in seconds an EC2 instance waits when terminating until all containers are moved to another EC2 instance (draining)."
}
variable "IAMUserSSHAccess" {
  type   = bool
  default= false
  description= "Synchronize public keys of IAM users to enable personalized SSH access (Doc: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/)."
}
variable "KeyName" {
  type   = string
  default= ""
  description= "Optional key pair of the ec2-user to establish a SSH connection to the EC2 instances of the ECS cluster."
}
variable "LoadBalancerCertificateArn" {
  type   = string
  default= ""
  description= "Optional Amazon Resource Name (ARN) of the certificate to associate with the load balancer."
}
variable "ParentClientStack2" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}
variable "PermissionsBoundary" {
  type   = string
  default= ""
  description= "Optional ARN for a policy that will be used as the permission boundary for all roles created by this template."
}
variable "SystemsManagerAccess" {
  type   = bool
  default= true
  description= "Enable AWS Systems Manager agent and authorization."
}
variable "InstanceType" {
  type   = string
  default= "t2.micro"
  description= "The instance type of the EC2 instances of the ECS cluster."
}
variable "LoadBalancerCertificateArn" {
  type   = string
  default= ""
  description= "Optional Amazon Resource Name (ARN) of the certificate to associate with the load balancer."
}
variable "LoadBalancerScheme" {
  type   = string
  default= "internet-facing"
  description= "Indicates whether the load balancer in front of the ECS cluster is internet-facing or internal."
}
variable "LogsRetentionInDays" {
  type   = number
  default= 14
  description= "Specifies the number of days you want to retain log events in the specified log group."
}
variable "ParentClientStack3" {
  type   = string
  default= ""
  description= "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}
variable "ParentSSHBastionStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent SSH bastion host/instance stack based on vpc/vpc-*-bastion.yaml template."
}
variable "DrainingTimeoutInSeconds" {
  type   = number
  default= 600
  description= "Maximum time in seconds an EC2 instance waits when terminating until all containers are moved to another EC2 instance (draining)."
}
variable "ParentAlertStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent alert stack based on operations/alert.yaml template."
}
variable "ParentAuthProxyStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent auth proxy stack based on security/auth-proxy-*.yaml template."
}
