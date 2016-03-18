Feature: filtering events
  
  As a Bernal Heights community member
  I want to be able to filter events by categories
  so that I can see only the types of events I care about
  
Background: events have been added to database

  Given the following events exist:
  | title                   | date          | time      | location         | category      |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00  | 1234 First Ave.  | Social        |
  | Library Movie Night     | 10-June-2016  | 20:00:00  | 5678 Reading St. | Social        |
  | Park Cleanup            | 20-June-2016  | 08:00:00  | 9876 Rose Dr.    | Volunteer     |
  | Community Carnival      | 27-June-2016  | 11:00:00  | 9876 Rose Dr.    | Social        |


  And I am on the All Events page

Scenario: restrict to events with category "Volunteer"
  When I check the following categories: Volunteer
  And I press "Refresh"
  Then I should see "Park Cleanup"
  And I should not see "Neighborhood Pool Party"

Scenario: no events exist for that category
  When I check the following categories: Community Meeting
  And I press "Refresh"
  Then I should be on the All Events 
  And I should see "There are no events for this category."
  