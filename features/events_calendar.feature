@noauth
Feature: Calendar View of Events

  As a neighbor,
  I want to be informed about community events,
  So that I can be an involved member of the neighborhood.

Background:
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | TODAYS_DATE   | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | true      |
  | Library Movie Night     | TOMORROW      | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  | Park Cleanup            | TOMORROW      | 08:00:00   | Bernal Heights Park              | Admin2           | admin2@test.com   | true      |
  | Fiesta on the Hill      | TOMORROW      | 11:00:00   | Bernal Heights Park              | Test             | test@test.com     | false     |

Scenario: See calendar
  When I go to the events page
  Then I should see "All Events"
  And I should see the calendar
  
Scenario: See events for particular day
  When I am on the events page
  # And I view this month
  And I click on 2016-6-10
  Then I should see "Neighborhood Pool Party"
  And I should not see "Library Movie Night"
  And I should not see "Park Cleanup"
  And I should not see "Fiesta on the Hill"
 
Scenario: No events on particular day
  When I am on the events page
  # And I view the June 2016 calendar
  And I click on yesterday
  # Then I should see "No events on June 21, 2016"
  Then I should not see "Library Movie Night"
  And I should not see "Neighborhood Pool Party"
  And I should not see "Park Cleanup"
  And I should not see "Fiesta on the Hill"
  