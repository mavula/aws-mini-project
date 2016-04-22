#!/bin/sh
# This script initiates infrastructure tests ##
# see feature/instance.feature  

AWS_REGION=$1
instance_id=$2
url=$3

if [[ $AWS_REGION && $instance_id && $url ]];
then
	export AWS_REGION=$AWS_REGION
	export instance_id=$instance_id
	export url=$url 

	cucumber .
else
	echo "USAGE: $0 us-west-2 i-d63a0d0e http://52.37.103.170"
	exit 1 
fi
