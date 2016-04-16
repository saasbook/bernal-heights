Given /the following hotspots exist/ do |hotspots_table|
  hotspots_table.hashes.each do |hotspot|
    new_hotspot = Hotspot.create!(hotspot)
  end
end

When /^(?:|I )select occurred time ([0-9 ]+[A|P]M), ([0-9]{2})$/ do |hour, minutes|
  select(hour, :from => "hotspot_occurred_time_4i")
  select(minutes, :from => "hotspot_occurred_time_5i")
end

When /^(?:|I )select occurred date ([0-9]{4}), ([a-zA-Z]+), ([0-9]{1})$/ do |year, month, day|
   select(year, :from => "hotspot_occurred_date_1i")
   select(month, :from => "hotspot_occurred_date_2i")
   select(day, :from => "hotspot_occurred_date_3i")
end

Then /location field should be prefilled with Bernal Heights coordinates/ do
    page.should have_field('Location', with: '37.7411622, -122.4178378')
end

When /I report issue for Bernal Heights/ do
    visit "/hotspots/new?location=37.7411622, -122.4178378"
end

When /I (un)?check the following issues: (.*)/ do |uncheck, issue_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  list_of_issues = issue_list.split(', ')
  list_of_issues.each do |issue|
    if uncheck
      uncheck("issues_#{issue}")
    else
      check("issues_#{issue}")
    end
  end
end

