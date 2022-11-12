resource "aws_iam_role" "ServiceRole" {
  force_detach_policies=false
  inline_policy {}
  managed_policy_arns=[
	"arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
	]

  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"ecs.amazonaws.com"}}],"Version":"2008-10-17"})
}
