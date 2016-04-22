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

When /I (un)?check the following categories: (.*)/ do |uncheck, category_list|
  # Filter events by category type e.g. Volunteer
  categories = category_list.split(", ")
  categories.each do |category|
    if uncheck
      uncheck("categories_#{category}")
    else
      check("categories_#{category}")
    end
  end
end

When /^I create an event with name "([^"]*)" as an admin$/ do |name|
  visit path_to("the admin create event page")
  step %Q{I fill in "Event Name" with "#{name}"}
  step %Q{I select start time 02 PM, 00}
  step %Q{I select start date 2016, December, 7}
  step %Q{I fill in "Location" with "Bernal Heights Public Library"}
  step %Q{I press "Create Event"}
end

When /^I create an event with name "([^"]*)" as regular user$/ do |name|
  visit path_to("the create event page")
  step %Q{I fill in "Event Name" with "#{name}"}
  step %Q{I select start time 02 PM, 00}
  step %Q{I select start date 2016, December, 7}
  step %Q{I fill in "Location" with "Bernal Heights Public Library"}
  step %Q{I fill in "Your Name" with "My Name"}
  step %Q{I fill in "Your E-mail" with "email@email.com"}
  step %Q{I fill in "Organizer Name" with "Library"}
  step %Q{I press "Create Event"}
end

When /^I create an event with name "([^"]*)" without my personal info$/ do |name|
  visit path_to("the New Event page")
  step %Q{I fill in "Event Name" with "#{name}"}
  step %Q{I select start time 02 PM, 00}
  step %Q{I select start date 2016, December, 7}
  step %Q{I fill in "Location" with "Bernal Heights Public Library"}
  step %Q{I press "Create Event"}
end

Given /^an event titled "([^"]*)" exists$/ do |arg1|
  FactoryGirl.build(:event, name: arg1)
end

Then /^I should see all the event information for "([^"]*)"$/ do |arg1|
  event = Event.where(name: arg1)
  step %Q{I should see "#{event.name}"}
  step %Q{I should see "#{event.start_time}"}
  step %Q{I should see "#{event.start_date}"}
  step %Q{I should see "#{event.location}"}
  step %Q{I should see "#{event.creator_name}"}
  step %Q{I should see "#{event.creator_email}"}
end

When (/^I should see the calendar$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When /^I click on (\d+), ([a-zA-Z]+), (\d+)$/ do |year, month, day|
  pending
end

When /^I view the ([a-zA-Z]+) (\d+) calendar$/ do |month, year|
  visit "/events?start_date=#{year}-#{month}-01"
end
