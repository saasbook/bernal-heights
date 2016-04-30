Feature: View Hotspots as Admin
  As an admin
  I want to see all hotspots listed
  So that I can better coordinate hotspot walks
Background:
  Given I am signed in as an admin
  And I am on the admin home page
  And my sample hotspots have been generated
  
Scenario: View all Hotspots
  
  When I follow "View Hotspot Forms"
  Then I should see all the current hotspot reports

  
  