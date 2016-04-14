@noauth
Feature: navigate to additional community resources

  As a resident of the bernal heights neighborhood
  I want a concise list of all community resources
  so my family and I can make use of resources available to us as residents.

Scenario: clicking on a resource link
  When I follow "https://alertsf.org/"
  Then I should see "AlertSF"
  
Scenario: clicking on the wrong resource link
  When I follow "http://sf311.org/"
  Then I should not see "Resources"
  
