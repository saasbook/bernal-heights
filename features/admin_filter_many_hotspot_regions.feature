# pulled tests out to restrict query limit since background was hitting limit
Feature: Filter hotspots by multiple regions

  As an admin, 
  I want to generate a report for all the hotspots within two or more region, 
  so that I can have a better understanding of problematic areas and divert resources appropriately.

Background:
  Given I am signed in as an admin
  Given the following hotspots exist:
  | issue_type                | location                                   |  occurred_time       | occurred_date | details          | creator_name  | creator_email |   creator_number | region        |
  | Car break-ins             | 1561 Treat Ave, San Francisco, CA 94110    |  01:55:00            | 2016-04-15    | North Bernal     | Test          | test@test.com |   (415)123-4567  | North         |
  | Illegal Drug Transcations | 222 Winfield St, San Francisco, CA 94110   |  01:55:00            | 2016-04-15    | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
  | Car break-ins             | 479 Prentiss St, San Francisco, CA 94110   |  01:55:00            | 2016-04-15    | South-East Bernal| Test          | test@test.com |   (415)123-4567  | South-East    |
  | Car break-ins             | 219 Richland Ave, San Francisco, CA 94110  |  01:55:00            | 2016-04-15    | South-West Bernal| Test          | test@test.com |   (415)123-4567  | South-West    |
  | Illegal Drug Transcations | 25 Eugenia Ave, San Francisco, CA 94110    |  01:55:00            | 2016-04-15    | Central Bernal   | Test          | test@test.com |   (415)123-4567  | Central       |
  Given I am on the admin dashboard page
  When I follow "View Hotspot Forms"

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