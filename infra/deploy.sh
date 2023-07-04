#/bin/bash
aws cloudformation delete-stack --stack-name 'SkeletonLambda'
aws s3 cp ../target/java11-lambda-skeleton.jar s3://faraz-sydney-bucket/lambda-skeleton/java11-lambda-skeleton.jar
aws cloudformation deploy --stack-name 'SkeletonLambda' --capabilities CAPABILITY_IAM --template-file lambda-cfn-template.yaml
