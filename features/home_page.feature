@noauth
Feature: learn more about 

  As a resident of the bernal heights neighborhood
  I want to first land on a homepage with details about Bernal Heights and the web app
  so that I can quickly learn about the community and the resources provided by the app

Scenario: clicking on the donate button
  Given I am on the home page
  And I press "DONATE"
  Then I should see "Support BHNC"
  
Scenario: clicking on the wrong resource link
  Given I am on the home page
  And I press "Resources"
  Then I should not see "create a new hotspot"

  
