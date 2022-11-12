resource "aws_iam_role" "BackupRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"backup.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "backuptofhlQ" {
  name="backuptofhlQ"
  role=aws_iam_role.BackupRole.id
  policy = jsonencode({"Statement":[{"Action":["ec2:CreateTags","ec2:DeleteSnapshot"],"Effect":"Allow","Resource":"arn::ec2:us-east-1::snapshot/*"},{"Action":["ec2:CreateImage","ec2:DeregisterImage","ec2:DescribeSnapshots","ec2:DescribeTags","ec2:DescribeImages","ec2:DescribeInstances","ec2:DescribeInstanceAttribute","ec2:DescribeInstanceCreditSpecifications","ec2:DescribeNetworkInterfaces","ec2:DescribeElasticGpus","ec2:DescribeSpotInstanceRequests"],"Effect":"Allow","Resource":"*"},{"Action":"ec2:CreateTags","Effect":"Allow","Resource":"arn::ec2:us-east-1::image/*"},{"Action":["ec2:CreateSnapshot","ec2:DeleteSnapshot","ec2:DescribeVolumes","ec2:DescribeSnapshots"],"Effect":"Allow","Resource":["arn::ec2:us-east-1::snapshot/*","arn::ec2:us-east-1:123456789012:volume/*"]}],"Version":"2012-10-17"})
}
