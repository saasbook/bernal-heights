Feature: Approve events

  As an admin, 
  I want to be able to see a list of events created/submitted by community members and approve the appropriate ones, 
  So that the calendar is not cluttered with unnecessary information.

Background:
  Given I am signed in as an admin
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | true      |
  | Library Movie Night     | 10-June-2016  | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00   | Bernal Heights Park              | Admin2           | admin2@test.com   | true      |
  | Fiesta on the Hill      | 27-June-2016  | 11:00:00   | Bernal Heights Park              | Test             | test@test.com     | false     |
  Given I am on the admin home page
  
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
  When I press "Approve Event"
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
  
# Scenario: Make sure if multiple events are on the page, the correct one gets approved