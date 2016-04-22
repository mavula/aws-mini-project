@webpage
Feature: Scripted creation of webpage with apache httpd on EC2 Instance  
    As a continuous delivery engineer
    I would like to provision environment and configure correctly

    Background:
	Given I can access the AWS environment
        And I know the webpage url

    Scenario: webpage is active with correct content 
        When I browse the webpage
        Then I should see it is active
	And  I should see that its has "Automation for the people" as content
