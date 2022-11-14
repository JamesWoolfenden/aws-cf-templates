variable "ParentWAFStack" {
  type        = string
  default     = ""
  description = "Optional stack name of parent WAF stack based on the security/waf.yaml template."
}
variable "StopContainerTimeoutInSeconds" {
  type        = number
  default     = 30
  description = "Time in seconds the ECS agent waits before killing a stopped container (see ECS_CONTAINER_STOP_TIMEOUT)."
}
variable "LoadBalancerIdleTimeout" {
  type        = number
  default     = 60
  description = "The idle timeout value, in seconds."
}
variable "LoadBalancerScheme" {
  type        = string
  default     = "internet-facing"
  description = "Indicates whether the load balancer in front of the ECS cluster is internet-facing or internal."
}
variable "ParentAlertStack" {
  type        = string
  default     = ""
  description = "Optional but recommended stack name of parent alert stack based on operations/alert.yaml template."
}
variable "ParentSSHBastionStack" {
  type        = string
  default     = ""
  description = "Optional but recommended stack name of parent SSH bastion host/instance stack based on vpc/vpc-*-bastion.yaml template."
}
variable "IAMUserSSHAccess" {
  type        = bool
  default     = false
  description = "Synchronize public keys of IAM users to enable personalized SSH access (Doc: https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/)."
}
variable "KeyName" {
  type        = string
  default     = ""
  description = "Optional key pair of the ec2-user to establish a SSH connection to the EC2 instances of the ECS cluster."
}
variable "ParentS3StackAccessLog" {
  type        = string
  default     = ""
  description = "Optional stack name of parent s3 stack based on state/s3.yaml template (with Access set to ElbAccessLogWrite) to store access logs."
}
variable "ContainerMaxCPU" {
  type        = number
  default     = 128
  description = "The maximum number of cpu reservation per container that you plan to run on this cluster. A container instance has 1,024 CPU units for every CPU core."
}
variable "LogsRetentionInDays" {
  type        = number
  default     = 14
  description = "Specifies the number of days you want to retain log events in the specified log group."
}
variable "ParentAuthProxyStack" {
  type        = string
  default     = ""
  description = "Optional stack name of parent auth proxy stack based on security/auth-proxy-*.yaml template."
}
variable "ParentClientStack2" {
  type        = string
  default     = ""
  description = "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}
variable "ParentVPCStack" {
  type        = string
  default     = null
  description = "Stack name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
variable "PermissionsBoundary" {
  type        = string
  default     = ""
  description = "Optional ARN for a policy that will be used as the permission boundary for all roles created by this template."
}
variable "SystemsManagerAccess" {
  type        = bool
  default     = true
  description = "Enable AWS Systems Manager agent and authorization."
}
variable "ContainerExcessThreshold" {
  type        = number
  default     = 10
  description = "Scale down if free cluster capacity >= containers (based on ContainerMaxCPU and ContainerMaxMemory settings)"
}
variable "ManagedPolicyArns" {
  type        = string
  default     = ""
  description = "Optional comma-delimited list of IAM managed policy ARNs to attach to the instance's IAM role"
}
variable "MaxSize" {
  type        = number
  default     = 4
  description = "The maximum size of the Auto Scaling group."
}
variable "MinSize" {
  type        = number
  default     = 2
  description = "The minimum size of the Auto Scaling group."
}
variable "SubnetsReach" {
  type        = string
  default     = "Public"
  description = "Should the cluster have direct access to the Internet or do you prefer private subnets with NAT?"
}
variable "DrainingTimeoutInSeconds" {
  type        = number
  default     = 600
  description = "Maximum time in seconds an EC2 instance waits when terminating until all containers are moved to another EC2 instance (draining)."
}
variable "InstanceType" {
  type        = string
  default     = "t2.micro"
  description = "The instance type of the EC2 instances of the ECS cluster."
}
variable "ParentClientStack1" {
  type        = string
  default     = ""
  description = "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}
variable "ContainerMaxMemory" {
  type        = number
  default     = 128
  description = "The maximum number of memory reservation (in MB)  per container that you plan to run on this cluster."
}
variable "ContainerShortageThreshold" {
  type        = number
  default     = 2
  description = "Scale up if free cluster capacity <= containers (based on ContainerMaxCPU and ContainerMaxMemory settings)"
}
variable "LoadBalancerCertificateArn" {
  type        = string
  default     = ""
  description = "Optional Amazon Resource Name (ARN) of the certificate to associate with the load balancer."
}
variable "ParentClientStack3" {
  type        = string
  default     = ""
  description = "Optional stack name of parent Client Security Group stack based on state/client-sg.yaml template to allow network access from the cluster to whatever uses the client security group."
}

variable "vpc_id" {
  type=string
  default=""
}