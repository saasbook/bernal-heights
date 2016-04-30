Feature: Approve events

  As an admin, 
  I want to be able to see a list of events created/submitted by community members and approve the appropriate ones, 
  So that the calendar is not cluttered with unnecessary information.

Background:
  Given I am signed in as an admin
  Given an event titled "Library Movie Night" exists
  Given an event titled "Park Cleanup" exists
  Given an event titled "Neighborhood Pool Party" exists
  Given an unapproved event titled "Fiesta on the Hill" exists
  
Scenario: See all unapproved events
  When I go to the approve events page
  Then I should see "Fiesta on the Hill"

Scenario: Approved events are not shown
  When I go to the approve events page
  Then I should not see "Library Movie Night"
  And I should not see "Park Cleanup" 
  And I should not see "Neighborhood Pool Party"
    
Scenario: Approve an event
  Given I am on the approve events page
  When I approve event "Fiesta on the Hill"
  Then I should see "Event Approved"
  And I should not see "Fiesta on the Hill"
  
  When I go to the events page
  Then I should see "Fiesta on the Hill"
 
Scenario: Non-admin cannot approve events
  Given I am signed out
  When I go to the approve events page
  Then I should see "You must be an administrator to see this page"
  And I should not see "Confirm Events"
  And I should be on the sign in page
  