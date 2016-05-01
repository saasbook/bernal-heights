@noauth
@load_issues
Feature: report an issue as a resident of bernal heights

  As a resident of the bernal heights neighborhood
  I want to report that the street light near my house is broken
  so it can be fixed by the appropriate city department and it would be safe for me and my fellow neighbors to get around after sunset.
  
 
Scenario: reporting an issue with all required fields filled 
  Given I am on the Hotspot map page
  And I follow "Create new hotspot"
  Then I should see "New Hotspot Form - Issue Type and Location"
  When I select the issues: Broken Streetlight
  And I fill in "Location" with "65 Cortland Ave, San Francisco, CA 94110"
  And I press "Next"
  Then I should see "New Hotspot Form - Issue Description"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 7
  And I fill in "Details" with "There is a broken light on Winfield St. which is a problem at night because it makes the street very dimly lit."
  And I press "Next"
  Then I should see "New Hotspot Form - Personal Information"
  And I fill in "Your Name" with "Joyce Toh"
  And I fill in "Your Email" with "joycetoh@berkeley.edu"
  And I fill in "Your Phone Number" with "123-456-7890"
  And I choose "hotspot_walk_true"
  And I press "Report Hotspot Issue"
  Then I should see "You have successfully reported an issue. Thank you!"
  
Scenario: reporting an issue without "Details" filled out 
  Given I am on the Hotspot map page
  And I follow "Create new hotspot"
  Then I should see "New Hotspot Form - Issue Type and Location"
  When I select the issues: Broken Streetlight
  And I fill in "Location" with "65 Cortland Ave, San Francisco, CA 94110"
  And I press "Next"
  Then I should see "New Hotspot Form - Issue Description"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 7
  And I press "Next"
  Then I should see "Details can't be blank"
  
@outofbounds
Scenario: location not in Bernal Heights Neighborhood
  Given I am on the Hotspot map page
  And I follow "Create new hotspot"
  Then I should see "New Hotspot Form - Issue Type and Location"
  When I select the issues: Broken Streetlight
  And I fill in "Location" with "New York, NY"
  And I press "Next"
  Then I should see "Region : Invalid address - not in Bernal Heights Neighborhood."
