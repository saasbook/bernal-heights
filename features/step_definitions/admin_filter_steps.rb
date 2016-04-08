Then /I should see all the current hotspot reports/ do
  rows_count = page.all('#hotspots tr').count - 1
  rows_count.should == Hotspot.count
end
