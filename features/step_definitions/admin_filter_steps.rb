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

Given(/^my sample hotspots have been generated$/) do
  illegal_drug_transactions = FactoryGirl.create(:issue, issue_type: "Illegal Drug Transactions") 
  car_break_in = FactoryGirl.create(:issue, issue_type: "Car Break-In") 
  abandoned_car = FactoryGirl.create(:issue, issue_type: "Abandoned Car") 
  h1 = FactoryGirl.build(:hotspot_without_issue, location: "479 Prentiss St, San Francisco, CA 94110", region: "South-East")
  h1.issues << illegal_drug_transactions
  h1.save!
  h2 = FactoryGirl.build(:hotspot_without_issue, location: "219 Richland Ave, San Francisco, CA 94110", region: "South-West")
  h2.issues << illegal_drug_transactions
  h2.save!
  h3 = FactoryGirl.build(:hotspot_without_issue, location: "25 Eugenia Ave, San Francisco, CA 94110", region: "Central")
  h3.issues << car_break_in
  h3.save!
  h4 = FactoryGirl.build(:hotspot_without_issue, location: "20 Eugenia Ave, San Francisco, CA 94110", region: "Central")
  h4.issues << car_break_in
  h4.issues << illegal_drug_transactions
  h4.save!
  h5 = FactoryGirl.build(:hotspot_without_issue, location: "1561 Treat Ave, San Francisco, CA 94110", region: "North")
  h5.issues << abandoned_car
  h5.save!
end

When /I (un)?check the following issue types: (.*)/ do |uncheck, issues_list|
  checked_issues = issues_list.split(',')
  checked_issues.each do |i|
    uncheck ? uncheck("issues_#{i}") : check("issues_#{i}")
  end
end