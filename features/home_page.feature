@noauth
Feature: learn more about 

  As a resident of the bernal heights neighborhood
  I want to first land on a homepage with details about Bernal Heights and the web app
  so that I can quickly learn about the community and the resources provided by the app

Scenario: landing on the homepage
  Given I am on the home page
  Then I should see "Our mission at Bernal Heights Neighborhood Center"
  
Scenario: clicking on the wrong resource link
  Given I am on the home page
  And I follow "Resources"
  Then I should not see "create new event"

  
