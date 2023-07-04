#/bin/bash
STACK_NAME='SkeletonLambda'
echo 'deleting stack: ' $STACK_NAME
aws cloudformation delete-stack --stack-name $STACK_NAME
echo 'uploading jar file to s3 bucket'
aws s3 cp ../target/java11-lambda-skeleton.jar s3://faraz-sydney-bucket/lambda-skeleton/java11-lambda-skeleton.jar
echo 'waiting for stack to be deleted'
sleep 10
echo 'deploying stack: ' $STACK_NAME
aws cloudformation deploy --stack-name $STACK_NAME --capabilities CAPABILITY_IAM --template-file lambda-cfn-template.yaml
