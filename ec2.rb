require 'rubygems'
require 'bundler/setup'
require 'aws-sdk'
require 'uuid'
require 'pp'

client = Aws::EC2::Client.new(region: 'us-west-2')
resource = Aws::EC2::Resource.new(client: client)
instance_id = "i-c4938703"

instances = client.describe_instances(filters: [{name: "instance-id", values: [instance_id]}]).reservations
instances.each do |i|
	puts i.instances.first.state.name
	puts i.instances.first.instance_type
	security_groups = i.instances.first.security_groups
	security_groups.each do |security_group|
		print "security group Name:", security_group.group_name, "\n"
                print "security group ID:", security_group.group_id , "\n"
        end
end

resource.instances.each do |instance|
	print "========== ID:" , instance.id, "====================\n"
	print  "Instance Type:", instance.instance_type, "\n"
	print  "Instance State:", instance.state.name, "\n"
	instance.security_groups.each do |securitygroup|
		print "security group Name:", securitygroup.group_name, "\n"
		print "security group ID:", securitygroup.group_id , "\n"
	end
end

client.describe_security_groups(group_ids: ['sg-6f9d960a']).security_groups.each do |group|
	group.ip_permissions.select do |perm|
		print "Port from:", perm.from_port, " to:", perm.to_port,"\n" 
    	end
end
