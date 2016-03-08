Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that event to the database here.
    new_event = Event.create(name: event["name"], start_date: event["start_date"], start_time: event["start_time"], location: event["location"], creator_name: event["creator_name"], creator_email: event["creator_email"])
  end
  #fail "Unimplemented"
end