Then /I should see all the current hotspot reports/ do
  rows_count = page.all('#hotspots tr').count - 1
  rows_count.should == Hotspot.count
end

When /I (un)?check the following regions: (.*)/ do |uncheck, region_list|
  checked_regions = region_list.split(',')
  checked_regions.each do |r|
    uncheck ? uncheck("regions_#{r}") : check("regions_#{r}")
  end
end

Given(/^there is a hotspot for each issue type$/) do
  pending # will generate factories here
end

When(/^I check the following issue types: Car break\-ins$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I uncheck the following issue types: Car break\-ins,Abandoned Car,Broken Streetlight,Illegal Drug Transactions,Litter\/Dumping Trash,Public Drinking and Noise,Other$/) do
  pending # Write code here that turns the phrase above into concrete actions
end