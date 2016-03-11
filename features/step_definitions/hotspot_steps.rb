When /^(?:|I )select date ([0-9]{4}), ([a-zA-Z]+), ([0-9]{1})$/ do |year, month, day|
   select(year, :from => "hotspot_occurred_time_1i")
   select(month, :from => "hotspot_occurred_time_2i")
   select(day, :from => "hotspot_occurred_time_3i")
end

