@noauth
Feature: Calendar View of Events

  As a neighbor,
  I want to be informed about community events,
  So that I can be an involved member of the neighborhood.

Scenario: See calendar
  When I go to the events page
  Then I should see "All Events"
  And I should see the calendar
  
Scenario: See events for today
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | TODAYS_DATE   | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | true      |
  | Library Movie Night     | TOMORROW      | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  When I am on the events page

  Then I should see "Neighborhood Pool Party"
  And I should not see "Library Movie Night"
 
Scenario: No events for today
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | TOMORROW      | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | true      |
  | Library Movie Night     | TOMORROW      | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  When I am on the events page
  Then I should not see "Library Movie Night"
  And I should not see "Neighborhood Pool Party"

  