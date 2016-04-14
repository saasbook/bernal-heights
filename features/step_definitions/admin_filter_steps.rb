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