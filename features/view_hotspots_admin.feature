Feature: View Hotspots as Admin
  As an admin
  I want to see all hotspots listed
  So that I can better coordinate hotspot walks

Background:
  Given I am signed in as an admin
  And I am on the Hotspot form page
  When I check the following issues: Broken Streetlight
  And I fill in "Location" with "266 Winfield St, San Francisco, CA 94110"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 7
  And I fill in "Details" with "There is a broken light on Winfield St. which is a problem at night because it makes the street very dimly lit."
  And I fill in "Your Name" with "Joyce Toh"
  And I fill in "Your Email" with "joycetoh@berkeley.edu"
  And I fill in "Your Phone Number" with "123-456-7890"
  And I choose "hotspot_walk_true"
  And I press "Report Hotspot Issue"
  
  And I am on the Hotspot form page
  When I check the following issues: Illegal Drug Transactions
  And I fill in "Location" with "Holly Park Circle"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 9
  And I fill in "Details" with "There is a lot of smoking in the park at night."
  And I fill in "Your Name" with "Joyce Toh"
  And I fill in "Your Email" with "joycetoh@berkeley.edu"
  And I fill in "Your Phone Number" with "123-456-7890"
  And I choose "hotspot_walk_true"
  And I press "Report Hotspot Issue"


Scenario: View all Hotspots
  When I am on the admin home page
  And I follow "View Hotspot Forms"
  Then I should see "There is a broken light on Winfield St. which is a problem at night because it makes the street very dimly lit."
  And I should see "There is a lot of smoking in the park at night."

  
  