#!/bin/sh

aws cloudformation create-stack  --stack-name mini-project  \
    --template-body file://webserver.template \
    --parameters  ParameterKey=InstanceType,ParameterValue=t1.micro ParameterKey=KeyName,ParameterValue=aws-test
