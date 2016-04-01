Feature: Approve events

  As an admin, 
  I want to be able to see a list of events created/submitted by community members and approve the appropriate ones, 
  So that the calendar is not cluttered with unnecessary information.

Background:
  Given I am signed in as an admin
  Given I am on the approve events page
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | false     |
  | Library Movie Night     | 10-June-2016  | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00   | Bernal Heights Park              | Admin2           | admin2@test.com   | true      |
  | Community Carnival      | 27-June-2016  | 11:00:00   | Good Life Grocery                | Test             | test@test.com     | false     |

Scenario: See all unapproved events
  Then I should see "Neighborhood Pool Party"
  And I should see "Community Carnvival"

Scenario: Approved events are not shown
  Then I should not see "Library Movie Night"
  And I should not see "Park Cleanup" 
    
Scenario: Approve an event
  When I press "Approve" within "Neighborhood Pool Party"
  Then I should see "Event Approved"
  And I should not see "Neighborhood Pool Party"
    
Scenario: Reject an event
  When I press "Reject" within "Community Carnival"
  Then I should see "Event Rejected"
  And I should not see "Community Carnival"
  
Scenario: Non-admin cannot approve events
  Given I am signed out
  When I go to approve events page
  Then I should see "You must be an administrator to see this page"
  And I should not see "Confirm Events"
  And I should be on the events page
  
  