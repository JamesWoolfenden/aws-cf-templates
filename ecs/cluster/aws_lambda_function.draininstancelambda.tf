resource "aws_lambda_function" "DrainInstanceLambda" {
  function_name="DrainInstanceLambda"
  role=""
  environment {
    variables={ 
	"CLUSTER"=""
	"DRAINING_TIMEOUT"="600"
	"QUEUE_URL"=""
 }
  }
  filename="DrainInstanceLambda.zip"
  handler="index.handler"
  layers=[]
  memory_size=128
  reserved_concurrent_executions=1
  runtime="nodejs16.x"
  timeout=30
}
