#!/bin/sh
# This script to initiate infrastructure tests ##
# see feature/instance.feature  

export AWS_REGION="us-west-2"
export instance_id="i-66f6dcbe"
cucumber .
