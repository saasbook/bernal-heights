@noauth
Feature: display all events 
 
  As a Bernal Heights community member,
  I want to view the events happening in my neighborhood
  So that I can go to the ones I want.


Background: events have been added to database
  
  Given the following events exist:
  | title                   | date          | time      | location         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00  | 1234 First Ave.  | Test             | test@test.com     | false     |
  | Library Movie Night     | 10-June-2016  | 20:00:00  | 5678 Reading St. | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00  | 9876 Rose Dr.    | Admin2           | admin2@test.com   | true      |
  | Community Carnival      | 27-June-2016  | 11:00:00  | 9876 Rose Dr.    | Test             | test@test.com     | false     |


Scenario: Show all events
  Given I am on the All Events page
  Then I should see "Neighborhood Pool Party"
  And I should see "Library Movie Night"
  And I should see "Park Cleanup"
  And I should see "Community Carnival"
