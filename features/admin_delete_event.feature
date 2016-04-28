Feature:
  As an admin
  I should be able to delete pending events and events from the calendar
  So that only appropriate and accurate information is shared on our calendar

Background:
  Given the following events exist:
  | name                    | start_date    | start_time | location                         | creator_name     | creator_email     | approved  |
  | Troll Event             | 15-June-2016  | 14:00:00   | Cortland Ave and Andover St      | Test             | test@test.com     | false     |
  | Library Movie Night     | 10-June-2016  | 20:00:00   | Bernal Heights Public Library    | Admin            | admin@test.com    | true      |
  | Park Cleanup            | 20-June-2016  | 08:00:00   | Bernal Heights Park              | Test             | test2@test.com    | false     |
  | Fiesta on the Hill      | 27-June-2016  | 11:00:00   | Bernal Heights Park              | Admin2           | admin2@test.com   | true      |

Scenario: Successfully delete pending event
  Given I am signed in as an admin
  When I go to the approve events page
  And I delete event "Troll Event"
  
  When I go to the approve events page
  Then I should not see "Troll Event"

Scenario: Cancel deleting pending event
  Given I am signed in as an admin
  When I go to the approve events page
  And I cancel deleting event "Park Cleanup"
  
  When I go to the approve events page
  Then I should see "Park Cleanup"

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
  