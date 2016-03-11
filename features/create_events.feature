@noauth
Feature: create a new community event 
 
  As a Bernal Heights community member
  So that I can make the community aware of the events I am hosting
  I want to post events in the app
  
Scenario: create a new event
  Given I am on the Show Events page
  And I press "Create New Event"
  Then I should be on the New Event page
  
Scenario: all required fields filled out
  Given I am on the New Event page
  And I fill in "Event Name" with "Pottery Painting Night"
  And I fill in "Address" with "123 4th St"
  And I fill in "Time" with "6PM"
  And I press "Post Event"
  Then I should see "Event 'Pottery Painting Night' has been created."
  
Scenario: missing a required fields
  Given I am on the New Event page
  And I press "Post Event"
  Then I should see "Please fill out these required fields: Event Name, Address, Time."
  
  