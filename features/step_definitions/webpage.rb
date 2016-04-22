require 'rspec/expectations'
require 'net/http'

Given(/^I know the webpage url$/) do
	@url = ENV['URL']
        expect(@url).to be
end

When(/^I browse the webpage$/) do
	@weburl = URI.parse("#{@url}")
	@req = Net::HTTP.new(@weburl.host, @weburl.port)
	@req.read_timeout = 10
	expect(@req).to be 
end

Then(/^I should see it is active$/) do
	res = @req.request_head(@weburl.path)
        expect(res.code).to eq("200"), "Webpage not found"
end

Then(/^I should see that its has "([^"]*)" as content$/) do |arg1|
	res = Net::HTTP.get_response(@weburl)
        expect(res.body).to include(arg1), "#{arg1} not found in page content"
end

