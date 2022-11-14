variable "HealthCheckPath" {
  type   = string
  default= "/"
  description= "Path of health check"
}
variable "LoadBalancerCertificateArn" {
  type   = string
  default= ""
  description= "Optional Amazon Resource Name (ARN) of the certificate to associate with the load balancer."
}
variable "LoadBalancerIdleTimeout" {
  type   = number
  default= 60
  description= "The idle timeout value, in seconds."
}
variable "ParentAuthProxyStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent auth proxy stack based on security/auth-proxy-*.yaml template."
}
variable "PermissionsBoundary" {
  type   = string
  default= ""
  description= "Optional ARN for a policy that will be used as the permission boundary for all roles created by this template."
}
variable "HealthCheckGracePeriod" {
  type   = number
  default= 60
  description= "The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy Elastic Load Balancing target health checks after a task has first started."
}
variable "LoadBalancerDeregistrationDelay" {
  type   = number
  default= 60
  description= "The amount time (in seconds) to wait before changing the state of a deregistering target from draining to unused."
}
variable "ParentWAFStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent WAF stack based on the security/waf.yaml template."
}
variable "SubDomainNameWithDot" {
  type   = string
  default= ""
  description= "Name that is used to create the DNS entry with trailing dot, e.g. §{SubDomainNameWithDot}§{HostedZoneName}. Leave blank for naked (or apex and bare) domain. Requires ParentZoneStack parameter!"
}
variable "DesiredCount" {
  type   = number
  default= 2
  description= "The number of simultaneous tasks, which you specify by using the TaskDefinition property, that you want to run on the cluster."
}
variable "MaxCapacity" {
  type   = number
  default= 4
  description= "The maximum number of simultaneous tasks, that you want to run on the cluster."
}
variable "MinCapacity" {
  type   = number
  default= 2
  description= "The minimum number of simultaneous tasks, that you want to run on the cluster."
}
variable "ParentClusterStack" {
  type   = string
  default= null
  description= "Stack name of parent Cluster stack based on ecs/cluster.yaml template."
}
variable "ParentZoneStack" {
  type   = string
  default= ""
  description= "Optional stack name of parent zone stack based on vpc/zone-*.yaml template."
}
variable "AutoScaling" {
  type   = bool
  default= true
  description= "Scale number of tasks based on CPU load?"
}
variable "Image" {
  type   = string
  default= null
  description= "The image to use for a container, which is passed directly to the Docker daemon. You can use images in the Docker Hub registry or specify other repositories (repository-url/image:tag)."
}
variable "LoadBalancerScheme" {
  type   = string
  default= "internet-facing"
  description= "Indicates whether the load balancer in front of the ECS service is internet-facing or internal."
}
variable "ParentAlertStack" {
  type   = string
  default= ""
  description= "Optional but recommended stack name of parent alert stack based on operations/alert.yaml template."
}
variable "ParentS3StackAccessLog" {
  type   = string
  default= ""
  description= "Optional stack name of parent s3 stack based on state/s3.yaml template (with Access set to ElbAccessLogWrite) to store access logs."
}
variable "ParentVPCStack" {
  type   = string
  default= null
  description= "Stack name of parent VPC stack based on vpc/vpc-*azs.yaml template."
}
