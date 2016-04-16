Feature: Filter hotspots by region


  As an admin, 
  I want to generate a report for all the hotspots within a particular region, 
  so that I can have a better understanding of problematic areas and divert resources appropriately

Background:
  Given I am signed in as an admin
  Given the following hotspots exist:
  | location                                   |  occurred_time       | occurred_date | details          | creator_name  | creator_email |   creator_number | region        |
  | 1561 Treat Ave, San Francisco, CA 94110    |  01:55:00            | 2016-04-15    | North Bernal     | Test          | test@test.com |   (415)123-4567  | North         |
  | 222 Winfield St, San Francisco, CA 94110   |  01:55:00            | 2016-04-15    | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
  | 479 Prentiss St, San Francisco, CA 94110   |  01:55:00            | 2016-04-15    | South-East Bernal| Test          | test@test.com |   (415)123-4567  | South-East    |
  | 219 Richland Ave, San Francisco, CA 94110  |  01:55:00            | 2016-04-15    | South-West Bernal| Test          | test@test.com |   (415)123-4567  | South-West    |
  | 25 Eugenia Ave, San Francisco, CA 94110    |  01:55:00            | 2016-04-15    | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
  Given I am on the admin home page
  When I follow "View Hotspot Forms"

Scenario: See all hotspot forms by default # need to discuss if we want to display all the data in the table
  Then I should see all the current hotspot reports

Scenario: Filter hotspot forms in the North Bernal Region
  When I check the following regions: North
  When I uncheck the following regions: Central,South-East,South-West
  And I press "Filter"
  Then I should see "1561 Treat Ave"
  And I should not see "222 Winfield St"
  And I should not see "479 Prentiss St"
  And I should not see "219 Richland Ave"
  And I should not see "25 Eugenia Ave"
