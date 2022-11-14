variable "SubDomainNameWithDot" {
  type   = string
  default= ""
  description= "Name that is used to create the DNS entry with trailing dot, e.g. §{SubDomainNameWithDot}§{HostedZoneName}. Leave blank for naked (or apex and bare) domain. Requires ParentZoneStack parameter!"
}
variable "HealthCheckGracePeriod" {
  type   = number
  default= 60
  description= "The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy Elastic Load Balancing target health checks after a task has first started."
}
variable "MaxCapacity" {
  type   = number
  default= 4
  description= "The maximum number of simultaneous tasks, that you want to run on the cluster."
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
variable "LoadBalancerPriority" {
  type   = number
  default= 1
  description= "The priority for the rule. Elastic Load Balancing evaluates rules in priority order, from the lowest value to the highest value. If a request satisfies a rule, Elastic Load Balancing ignores all subsequent rules. A target group can have only one rule with a given priority."
}
variable "MinCapacity" {
  type   = number
  default= 2
  description= "The minimum number of simultaneous tasks, that you want to run on the cluster."
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
variable "DesiredCount" {
  type   = number
  default= 2
  description= "The number of simultaneous tasks, that you want to run on the cluster."
}
variable "LoadBalancerDeregistrationDelay" {
  type   = number
  default= 60
  description= "The amount time (in seconds) to wait before changing the state of a deregistering target from draining to unused."
}
variable "LoadBalancerHttps" {
  type   = bool
  default= false
  description= "If the cluster supports HTTPS (LoadBalancerCertificateArn is set) you can enable HTTPS for the service"
}
variable "LoadBalancerHostPattern" {
  type   = string
  default= ""
  description= "Optional host pattern. Specify LoadBalancerPath and/or LoadBalancerHostPattern."
}
variable "HealthCheckPath" {
  type   = string
  default= "/"
  description= "Path of health check"
}
variable "Image" {
  type   = string
  default= null
  description= "The image to use for a container, which is passed directly to the Docker daemon. You can use images in the Docker Hub registry or specify other repositories (repository-url/image:tag)."
}
variable "LoadBalancerPath" {
  type   = string
  default= "service"
  description= "Optional path part of the path pattern. E.g., for service, the path pattern will be /service/*.  Specify LoadBalancerPath and/or LoadBalancerHostPattern."
}
variable "ParentClusterStack" {
  type   = string
  default= null
  description= "Stack name of parent Cluster stack based on ecs/cluster.yaml template."
}
