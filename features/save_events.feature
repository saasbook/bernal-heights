@noauth
Feature: Save Events
As a Bernal Heights neighbor, 
I want to save events I'm interested in, 
so that I can have a personalized agenda.

Background: 
  Given the following events exist:
  | name                    | start_date    | start_time | location         | creator_name     | creator_email     | approved  |
  | Neighborhood Pool Party | 15-June-2016  | 14:00:00   | 1234 First Ave.  | Test             | test@test.com     | true      |
  | Library Movie Night     | 10-June-2016  | 20:00:00   | 5678 Reading St. | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00   | 9876 Rose Dr.    | Admin2           | admin2@test.com   | true      |
  | Community Carnival      | 27-June-2016  | 11:00:00   | 9876 Rose Dr.    | Test             | test@test.com     | true      |

Scenario: Save an event
  Given I am on the events page
  When I follow "Neighborhood Pool Party"
  And I press "Save"
  Then I should see "Added to your schedule"
  And I should see "Saved"

Scenario: Un-save an event
  Given I am on the events page
  When I follow "Neighborhood Pool Party"
  When I press "Saved"
  Then I should see "Removed from your schedule"
  And I should see "Save"

Scenario: View saved events
  Given I am on the events page
  When I follow "Community Carnival"
  And I press "Save"
  And I go to the my events page
  
  Then I should see "Community Carnival"

Scenario: Un-saved events are no longer on the my events page
  Given I am on the events page
  And I follow "Library Movie Night"
  And I press "Save"
  
  When I go to the my events page
  Then I should see "Library Movie Night"
  
  When I follow "Library Movie Night"
  And I press "Saved"
  And I go to the my events page
  Then I should not see "Library Movie Night"
  
