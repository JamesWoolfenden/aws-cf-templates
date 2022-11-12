resource "aws_lambda_function" "ScaleUpLambda" {
  function_name="ScaleUpLambda"
  role=""
  environment {
    variables={ 
	"SCALING_POLICY_NAME"=""
 }
  }
  filename="ScaleUpLambda.zip"
  handler="index.handler"
  layers=[]
  memory_size=128
  runtime="nodejs16.x"
  timeout=60
}
