Feature: Filter hotspots by region
  
  As an admin, 
  I want to generate a report for all the hotspots within a particular region, 
  so that I can have a better understanding of problematic areas and divert resources appropriately

Background:
  Given I am signed in as an admin
  And I am on the admin home page
  And my sample hotspots have been generated
  When I follow "View Hotspot Forms"

Scenario: See all hotspot forms by default 
  Then I should see all the current hotspot reports

Scenario: Filter hotspot forms in the North Bernal Region
  When I check the following regions: North
  When I uncheck the following regions: Central,South-East,South-West
  And I press "Filter"
  Then I should see "1561 Treat Ave"
  And I should not see "20 Eugenia Ave"
  And I should not see "479 Prentiss St"
  And I should not see "219 Richland Ave"
  And I should not see "25 Eugenia Ave"

Scenario: Filter hotspot forms in the North and Central Region
  When I check the following regions: North,Central
  When I uncheck the following regions: South-East,South-West
  And I press "Filter"
  Then I should see "1561 Treat Ave"
  And I should see "20 Eugenia Ave"
  And I should see "25 Eugenia Ave"
  And I should not see "479 Prentiss St"
  And I should not see "219 Richland Ave"

Scenario: Unselect all regions #sad path redirects to default
  When I uncheck the following regions: North,Central,South-East,South-West
  And I press "Filter"
  Then I should see all the current hotspot reports
