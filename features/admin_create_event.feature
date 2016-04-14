Feature:
  As an admin
  I want to create events that automatically appear in the calendar
  So I don't need to go through the hassle of approving them

Scenario: Can access event form from admin home page
  Given I am signed in as an admin
  When I am on the admin home page
  And I follow "Create New Event"
  Then I should be on the admin create event page

Scenario: Can access event form from public-facing event page
  Given I am signed in as an admin
  When I am on the events page
  And I follow "Create New Event"
  Then I should be on the admin create event page

Scenario: Non-admins cannot access the admin event form
  Given I am signed out
  When I go to the admin create event page
  Then I should see "You must sign in as an administrator to see this page"
  And I should be on the sign in page

#Admin doesn't need to fill in name/email fields.
Scenario: Create event successfully
  Given I am signed in as an admin
  When I create an event with name "Hotspot Walk" as an admin
  Then I should see "Hotspot Walk was successfully created"
  And I should be on the events page
  And I should see "Hotspot Walk"
  
  When I go to the approve events page
  Then I should not see "Hotspot Walk"

#Revisit after some UI/UX work -- need more informative errors!
#May need to integrate with whatever error messages simple form produces once that's working
Scenario: Missing fields
  Given I am on the admin create event page
  And I follow "Create new event"
  Then I should see "You have not filled out all required fields."


