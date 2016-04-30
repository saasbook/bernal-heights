When(/^I archieve the hotspot with ID "(.*?)"$/) do |id|
  find(:xpath, "//a[@href='/admin/hotspots/#{id}' and @data-method='put']").click
end

Then(/^I should not see any hotspot$/) do
    rows_count = page.all('#hotspots tr').count - 1
    rows_count.should == 0
end