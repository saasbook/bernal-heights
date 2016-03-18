Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    new_event = Event.create!(event)
  end
end

When /^(?:|I )select start time ([0-9 ]+[A|P]M), ([0-9]{2})$/ do |hour, minutes|
   select(hour, :from => "event_start_time_4i")
   select(minutes, :from => "event_start_time_5i")
end

When /^(?:|I )select start date ([0-9]{4}), ([a-zA-Z]+), ([0-9]{1})$/ do |year, month, day|
   select(year, :from => "event_start_date_1i")
   select(month, :from => "event_start_date_2i")
   select(day, :from => "event_start_date_3i")
end