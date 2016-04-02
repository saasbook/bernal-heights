@noauth
Feature: display all events 
 
  As a Bernal Heights community member,
  I want to view the events happening in my neighborhood
  So that I can go to the ones I want.


Background: events have been added to database
  
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | true      |
  | Library Movie Night     | 10-June-2016  | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00   | Bernal Heights Park              | Admin2           | admin2@test.com   | true      |
  | Fiesta on the Hill      | 27-June-2016  | 11:00:00   | Bernal Heights Park              | Test             | test@test.com     | true      |


Scenario: Show all events
  Given I am on the All Events page
  Then I should see "Neighborhood Pool Party"
  And I should see "Library Movie Night"
  And I should see "Park Cleanup"
  And I should see "Fiesta on the Hill"
