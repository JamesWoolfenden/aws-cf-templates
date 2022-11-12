resource "aws_db_subnet_group" "DBSubnetGroup" {
  name       = "dbsubnetgroup"
  subnet_ids = [  ]
  description="DB subnet group"
}
