AWS MINI PROJECT with Infrastructure tests
======================

This project uses AWS SDK Ruby and CloudFormation template to deploy and configure an EC2 Instance with Apache httpd and a message <b>Automation for the People</b> in index.html in document root and runs infrastructure tests using Cucumber.
 
CloudFormation template will create Security Group, launch a t2.micro instance and assign Elastic IP.  

Dependencies:
======================
This project requires ruby, aws-sdk to be installed on your machine, to setup run below commands. I assume you using Amazon Linux AMI. 

```
sudo yum install ruby rubygems
sudo gem install aws-sdk bundler cucumber
bundle install
```

Now configure AWS Credentials

```
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```

Usage:
============================

Clone this repository and run the Ruby script inside that will spin up the EC2 instance, and then Apache webserver inside of it. 
Run this command to set everything up:

    ruby launch --aws-region aws-region-to-build-in --key-name your-ec2-keypair-name --stack-name mini-project

The parameters are:

* **key-name**: [required] the name of an EC2 keypair that exists in that region. It will be linked to the instance. 
* **aws-region**: [optional] The AWS region you want to run everything in. Defaults to US-West-2, Oregon.
* **stack-name**: [optional] Name of the CloudFormation stack. Defaults to mini-project.
* **create**: [optional] flag to create stack. Defaults to true.  
* **delete**: [optional] flag to delete stack. Defaults to false. 


Infrastructure Tests:
===================================

launch script initiates infrastructure tests after stack creation. See runtests.sh to kick off without ruby launch script.  
