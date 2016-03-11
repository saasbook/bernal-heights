@noauth
Feature: report an issue as a resident of bernal heights

  As a resident of the bernal heights neighborhood
  I want to report that the street light near my house is broken
  so it can be fixed by the appropriate city department and it would be safe for me and my fellow neighbors to get around after sunset.

Background: go to the Hotspot form page
  And I am on the Hotspot form page
  Then I should see "Hotspots#new"

Scenario: reporting an issue with all required fields filled (type of issue and location)
  When I fill in "Type of Issue" with "Street Light"
  And I fill in "Location" with "245 College Ave, San Francisco, CA 94112"
  And I press "Report Hotspot Issue"
  Then I should see "You have successfully reported an issue. Thank you!"
  
Scenario: missing required fields
  When I press "Report Hotspot Issue"
  Then I should see "You have not filled out all required fields."
  
Scenario: reporting an issue with detailed information
  Given I fill in "Type of Issue" with "Illegal drug transactions" 
  And I fill in "Location" with "123 Cortland Ave"
  And I select date 2016, March, 2
  And I fill in "Details" with "I have seen groups of people going around vandlizing homes on Cortland."
  And I choose "hotspot_to_share_true"
  And I fill in "Your Name" with "John Smith"
  And I fill in "Your Email" with "johnsmith@gmail.com"
  And I fill in "Your Phone Number" with "(415)123-4567"
  Then I press "Report Hotspot Issue"
  Then I should see "You have successfully reported an issue. Thank you!"

# Following scenariosmay be added in the future
# Scenario: reporting an issue via geotags
  # write your steps here
  #And I fill in "Can we share your info with the SFPD?" with "yes"

# Scenario: reporting an issue via clicking on map coordinates/dropping pin
  # write your steps here