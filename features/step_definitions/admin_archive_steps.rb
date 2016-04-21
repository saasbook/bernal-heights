When(/^I select archive for: row(\d+) \#the hotspot at (\d+) Treat Ave; fix selector id\/unique$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I press archive$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select archive for: row(\d+), row(\d+), row(\d+), row(\d+), row(\d+)$/) do |arg1, arg2, arg3, arg4, arg5|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see any hotspot$/) do
    rows_count = page.all('#hotspots tr').count - 1
    rows_count.should == 0
end