Feature: Filter hotspots by region

  As an admin, 
  I want to see all hotspots within a particular region
  So that I can generate more informative reports/plan my walks.

Background:
  Given I am signed in as an admin
  Given the following hotspots exist:
  | issue_type       | location                 | occurred_time |   details         | creator_name  | creator_email |   creator_number | walk   |
  | Car break-ins    | Folsom St & Ripley St    | 15-June-2016  |  North Bernal     | Test          | test@test.com |   (415)123-4567  | yes    |
  | Graffiti         | 146 & 148 Bocana St      | 10-June-2016  |  Central Bernal   | Test          | test@test.com |   (415)123-4567  | no     |
  | Car break-ins    | 4020 Folsom St           | 20-June-2016  |  South-East Bernal| Test          | test@test.com |   (415)123-4567  | yes    |
  | Car break-ins    | 105 Highland Ave         | 20-June-2016  |  South-West Bernal| Test          | test@test.com |   (415)123-4567  | no     |
  | Graffiti         | 120 & 122 Bocana St      | 12-June-2016  |  Central Bernal   | Test          | test@test.com |   (415)123-4567  | yes    |
  Given I am on the admin dashboard page
  When I follow "View Hotspot Forms"

Scenario: See all hotspot forms by default # need to discuss if we want to display all the data in the table
  Then I should see all the current hotspot reports

Scenario: Filter hotspot forms in the North Bernal Region
  When I check North Bernal Region
  And I press "Filter"
  Then I should see see "Folsom St & Ripley St"
  And I should not see "146 & 148 Bocana St"
  And I should not see "4020 Folsom St"
  And I should not see "105 Highland Ave"
  And I should not see "120 & 122 Bocana St"
    
Scenario: Filter hotspot forms in the North and Central Region
  When I check the following regions: North, Central
  Then I should see "Folsom St & Ripley St"
  And I should see "146 & 148 Bocana St"
  And I should see "120 & 122 Bocana St"
  And I should not see "4020 Folsom St"
  And I should not see "105 Highland Ave"

Scenario: Select all regions
  When I check the following regions: North, Central, South-East, South-West
  Then I should see all the current hotspot reports

# need to clarify: should we allow public users to filter forms?
