Feature: Filter hotspots by issue types


  As an admin, 
  I want to generate a report for all the hotspots of particular issue types, 
  so that I can have a better understanding of current distributions of crimes/problems and divert resources appropriately

#for now; will generate factories later
Background:
  Given I am signed in as an admin
  And I am on the admin home page
  When I follow "View Hotspot Forms"
  And there is a hotspot for each issue type

Scenario: See all hotspot forms by default 
  Then I should see all the current hotspot reports

Scenario: Filter hotspot forms by Car break-ins
  When I check the following issue types: Car break-ins
  And I press "Filter"
  Then I should see "1561 Treat Ave"
  And I should not see "222 Winfield St"
  And I should not see "479 Prentiss St"
  And I should not see "219 Richland Ave"
  And I should not see "25 Eugenia Ave"
  
Scenario: Sad path where user unselects everything
  When I uncheck the following issue types: Car break-ins,Abandoned Car,Broken Streetlight,Illegal Drug Transactions,Litter/Dumping Trash,Public Drinking and Noise,Other
  Then I should not see any hotspot