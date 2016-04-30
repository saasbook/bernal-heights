Feature: Admin can archive hotspots

  As an admin, 
  I want to archive old hotspot forms accordingly after a safety walk, 
  so my data isn't cluttered with outdated information and I can better evaluate the safety concerns of the neighborhood.

Background:
  Given I am signed in as an admin
  And I am on the admin home page
  And my sample hotspots have been generated
  When I follow "View Hotspot Forms"

Scenario: See all hotspot forms by default 
  Then I should see all the current hotspot reports

Scenario: Archive a hotspot form #ID1
  When I archieve the hotspot with ID "1"
  Then I should see "You have successfully archived hotspot 1."
  And I should not see "479 Prentiss St"
  And I should see "219 Richland Ave"
  And I should see "25 Eugenia Ave"
  And I should see "20 Eugenia Ave"
  And I should see "1561 Treat Ave"
  
Scenario: Archive multiple hotspot forms #ID2,3 
  When I archieve the hotspot with ID "2"
  Then I should see "You have successfully archived hotspot 2."
  When I archieve the hotspot with ID "3"
  Then I should see "You have successfully archived hotspot 3."