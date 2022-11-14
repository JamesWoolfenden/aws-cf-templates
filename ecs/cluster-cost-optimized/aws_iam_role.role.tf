resource "aws_iam_role" "Role" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"}}],"Version":"2012-10-17"})
}


resource "aws_iam_role_policy" "ecsYfSmIu" {
  name="ecsYfSmIu"
  role=aws_iam_role.Role.id
  policy = jsonencode({"Statement":[{"Action":["ecs:DiscoverPollEndpoint"],"Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ecs-clusterYfSmIu" {
  name="ecs-clusterYfSmIu"
  role=aws_iam_role.Role.id
  policy = jsonencode({"Statement":[{"Action":["ecs:RegisterContainerInstance","ecs:SubmitContainerStateChange","ecs:SubmitTaskStateChange","ecs:ListContainerInstances"],"Effect":"Allow","Resource":"arn:aws:ecs:us-east-1:123456789012:cluster/"}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ecs-cluster-instanceYfSmIu" {
  name="ecs-cluster-instanceYfSmIu"
  role=aws_iam_role.Role.id
  policy = jsonencode({"Statement":[{"Action":["ecs:Poll","ecs:StartTelemetrySession","ecs:UpdateContainerInstancesState","ecs:ListTasks","ecs:DescribeContainerInstances"],"Condition":{"StringEquals":{"ecs:cluster":"arn:aws:ecs:us-east-1:123456789012:cluster/"}},"Effect":"Allow","Resource":"arn:aws:ecs:us-east-1:123456789012:container-instance/*"}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ecrYfSmIu" {
  name="ecrYfSmIu"
  role=aws_iam_role.Role.id
  policy = jsonencode({"Statement":[{"Action":["ecr:GetAuthorizationToken","ecr:BatchCheckLayerAvailability","ecr:GetDownloadUrlForLayer","ecr:BatchGetImage"],"Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "logsYfSmIu" {
  name="logsYfSmIu"
  role=aws_iam_role.Role.id
  policy = jsonencode({"Statement":[{"Action":["logs:CreateLogGroup","logs:CreateLogStream","logs:PutLogEvents","logs:DescribeLogStreams"],"Effect":"Allow","Resource":null}],"Version":"2012-10-17"})
}
