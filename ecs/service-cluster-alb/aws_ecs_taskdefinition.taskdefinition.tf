resource "aws_ecs_task_definition" "TaskDefinition" {
  container_definitions = jsonencode([
{
  disableNetworking= false
  dnsSearchDomains = []
  dnsServers=[]
  dockerSecurityOptions=[]
  entryPoint=[]
  essential=true
  hostname=""
  image=""
  interactive=false
  links=[]
  logConfiguration={
    LogDriver = "awslogs"
    Options={
      awslogs-group=""
      awslogs-region="us-east-1"
      awslogs-stream-prefix="goformation-stack"
    }
    SecretOptions =[]
  }
  memory=128
  name="main"
  portMappings = [
  {
    ContainerPort = 80
    Protocol = "tcp"
  },
  ]
  privileged=false
  pseudoTerminal=false
  readonlyRootFilesystem=false
  user=""
  workingDirectory=""
},])
  cpu               = ""
  execution_role_arn= ""
  family            = "goformation-stack"
  network_mode      = "bridge"
  requires_compatibilities=[]
}
