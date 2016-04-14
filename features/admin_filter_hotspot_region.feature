Feature: Filter hotspots by region

  As an admin, 
  I want to see all hotspots within a particular region
  So that I can generate more informative reports/plan my walks.

Background:
  Given I am signed in as an admin
  Given the following hotspots exist:
  | issue_type       | location                                   | details          | creator_name  | creator_email |   creator_number | region        |
  | Car break-ins    | 1561 Treat Ave, San Francisco, CA 94110    | North Bernal     | Test          | test@test.com |   (415)123-4567  | North         |
  | Graffiti         | 222 Winfield St, San Francisco, CA 94110   | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
  | Car break-ins    | 479 Prentiss St, San Francisco, CA 94110   | South-East Bernal| Test          | test@test.com |   (415)123-4567  | South-East    |
  | Car break-ins    | 219 Richland Ave, San Francisco, CA 94110  | South-West Bernal| Test          | test@test.com |   (415)123-4567  | South-West    |
  | Graffiti         | 25 Eugenia Ave, San Francisco, CA 94110    | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
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
    
Scenario: Filter hotspot forms in the North and Central Region
  When I check the following regions: North,Central
  When I uncheck the following regions: South-East,South-West
  And I press "Filter"
  Then I should see "1561 Treat Ave"
  And I should see "222 Winfield St"
  And I should see "25 Eugenia Ave"
  And I should not see "479 Prentiss St"
  And I should not see "219 Richland Ave"

Scenario: Select all regions
  When I check the following regions: North,Central,South-East,South-West
  And I press "Filter"
  Then I should see all the current hotspot reports

# need to clarify: should we allow public users to filter forms?
