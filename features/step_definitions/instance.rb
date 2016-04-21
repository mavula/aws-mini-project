require 'aws-sdk-core'
require 'rspec/expectations'

Given(/^I can access the AWS environment$/) do
	@client = Aws::EC2::Client.new(region: ENV['AWS_REGION'])
	
end

Given(/^I know what EC2 instance to look at$/) do
  	resp = @client.describe_instances(filters: [{name: "instance-id", values: [ENV['instance_id']]}]).reservations
	resp.each do |i|
		@instance = i.instances.first 
		break	
	end
end

When(/^I lookup the instance information$/) do
        expect(@instance).to be
end

Then(/^I should see it is a "(.*?)" instance$/) do |arg|
	instance_type = @instance.instance_type
  	expect(instance_type).to eq(arg), "Instance is wrong type, expect '#{arg}', but found '#{instance_type}'"
end

Then(/^I should see that it is associated with an elastic IP$/) do
	expect(@instance.network_interfaces.size).to be > 0
	eips_for_instance = @client.describe_addresses.addresses.select {|eip|  eip.instance_id == @instance.instance_id}
  	expect(eips_for_instance.size).to be(1), "Expected one EIP associated with the instance, found #{eips_for_instance.size}"
end

Then(/^I should see that its security group allows port "(.*?)"$/) do |port|
  	groups = @instance.security_groups
  	expect(groups.size).to eq(1)

  	@client.describe_security_groups(group_ids: [groups.first.group_id]).security_groups.each do |group|
    		found = group.ip_permissions.select do |perm|
      			perm.from_port == port.to_i && perm.to_port == port.to_i
    		end
    		expect(found.size).to eq(1), "Did not find port #{port} open in security group #{group.group_name}"
  	end
end
