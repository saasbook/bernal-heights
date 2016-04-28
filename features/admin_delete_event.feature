Feature:
  As an admin
  I should be able to delete pending events and events from the calendar
  So that only appropriate and accurate information is shared on our calendar

Background:
  Given an unapproved event titled "Troll Event" exists
  Given an unapproved event titled "Park Cleanup" exists
  Given an event titled "Library Movie Night" exists
  Given an event titled "Fiesta on the Hill" exists

@javascript
Scenario: Successfully delete pending event
  Given I am signed in as an admin
  When I go to the approve events page
  And I delete event "Troll Event"
  
  When I go to the approve events page
  Then I should not see "Troll Event"

@javascript
Scenario: Cancel deleting pending event
  Given I am signed in as an admin
  When I go to the approve events page
  And I cancel deleting event "Park Cleanup"
  
  When I go to the approve events page
  Then I should see "Park Cleanup"

@javascript
Scenario: Successfully delete existing event
  Given I am signed in as an admin
  When I go to the events page
  And I delete event "Library Movie Night"
  
  When I go to the events page
  Then I should not see "Library Movie Night"

Scenario: Non-admins cannot delete existing events
  Given I am signed out
  When I go to the events page
  And I follow "Fiesta on the Hill"
  Then I should not be able to delete the event
  And I should see all the event information for "Fiesta on the Hill"
  