Feature:
  As an admin
  I want to create events that automatically appear in the calendar
  So I don't need to go through the hassle of approving them

Scenario: Can access event form from admin home page
  Given I am signed in as an admin
  When I am on the admin home page
  And I press "Create New Event"
  Then I should be on the admin create event page

Scenario: Can access event form from public-facing event page
  Given I am signed in as an admin
  When I am on the events page
  And I press "Create New Event"
  Then I should be on the admin create event page

Scenario: Non-admins cannot access the admin event form
  Given I am signed out
  When I go to the admin create event page
  Then I should see "You must be an administrator to see this page"
  And I should be on the sign in page

#Admin doesn't need to fill in name/email fields.
Scenario: Create event successfully
  Given I am signed in as an admin
  When I create an event with name "Hotspot Walk" as an admin
  Then I should see "Hotspot Walk was successfully created"
  And I should be on the admin events page
  And I should not see "Hotspot Walk" within "#unapproved"
  
  When I go to the events page
  Then I should see "Hotspot Walk"
  
Scenario: Logged out users must fill in name and email
  Given I am signed out
  When I create an event with name "Reading Hour" without my personal info
  Then I should see "Your name is required."
  Then I should see "Your e-mail is required."

#Create event feature should take care of these tests
#This feature should focus on the unique admin aspect
Scenario: Missing fields
  Given I am on the admin create event page
  And I press "Create Event"
  Then I should see "You have not filled out all required fields."


