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
