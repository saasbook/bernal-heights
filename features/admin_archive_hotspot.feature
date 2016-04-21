Feature: Admin can archive hotspots


  As an admin, 
  I want to archive old hotspot forms accordingly after a safety walk, 
  so my data isn't cluttered with outdated information and I can better evaluate the safety concerns of the neighborhood.

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

Scenario: See all hotspot forms by default
  Then I should see all the current hotspot reports

Scenario: Archive a hotspot form (1561 Treat Ave, San Francisco, CA 94110)
  When I select archive for: row1 #the hotspot at 1561 Treat Ave; fix selector id/unique
  And I press archive
  Then I should not see "1561 Treat Ave"
  And I should see "222 Winfield St"
  And I should see "479 Prentiss St"
  And I should see "219 Richland Ave"
  And I should see "25 Eugenia Ave"
  
Scenario: Archive all the hotspot forms (in background)
  When I select archive for: row1, row2, row3, row4, row5
  And I press archive
  Then I should not see any hotspot
 
Scenario: Try to archive without selecting any row/hotspot form (sad path)
  When I press archive
  Then I should see "You haven't select anything to archive."