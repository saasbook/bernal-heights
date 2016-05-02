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
  
# Scenario: adding a new resource 
#   Given I am signed in as an admin
#   Given I am on the admin resource page
#   When I press "Add a new resource"
#   And I am on the add resource path
#   And I fill in "Title" with "Neighborhood Emergency Response Team (NERT)"
#   And I fill in "Description" with "Learn hands-on skills to prepare for and help after disasters"
#   And I fill in "Link" with "http://www.sf-fire.org/index.aspx?page=859"
#   When I press "Create Resource"
#   Then I should see "Resource was successfully created."
  
