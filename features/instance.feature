@ec2-instance
Feature: Scripted creation of EC2 Instance 
    As a continuous delivery engineer
    I would like my instance to be installed and configured correctly
    so that that my infrastructure server will work as expected

    Background:
        Given I can access the AWS environment
        And I know what EC2 instance to look at

    Scenario: The EC2 instance is configured correctly
        When I lookup the instance information
        Then I should see it is a "t1.micro" instance
	And  I should see that its security group allows port "22"
        And  I should see that its security group allows port "80"
	And  I should see that it is associated with an elastic IP
