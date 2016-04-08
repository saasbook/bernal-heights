Then /I should see all the current hotspot reports/ do
  rows_count = page.all('#hotspots tr').count - 1
  rows_count.should == Hotspot.count
end

When(/^I check North Bernal Region$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see see "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check the following regions: North, Central$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check the following regions: North, Central, South\-East, South\-West$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check Car break\-ins$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I uncheck Car break\-ins$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I check Graffiti$/) do
  pending # Write code here that turns the phrase above into concrete actions
end