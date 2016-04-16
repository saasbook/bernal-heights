@noauth
Feature: navigate to additional community resources

  As a resident of the bernal heights neighborhood
  I want a concise list of all community resources
  so my family and I can make use of resources available to us as residents.

Scenario: clicking on a resource link
  Given I am on the resources page
  Then I should see "NON-EMERGENCY POLICE"
  
Scenario: clicking on the wrong resource link
  Given I am on the resources page
  Then I should not see "create a new hotspot"
  
