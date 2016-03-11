@noauth
Feature: create a new community event 
 
  As a Bernal Heights community member
  So that I can make the community aware of the events I am hosting
  I want to post events in the app
  
Scenario: create a new event
  Given I am on the All Events page
  And I follow "Create new event"
  Then I should be on the New Event page
  
Scenario: all required fields filled out
  Given I am on the New Event page
  And I fill in "Name" with "Pottery Painting Night"
  And I select start time 02 PM, 00
  And I select start date 2013, December, 7
  And I fill in "Location" with "Brushstrokes Studio"
  And I fill in "Your Name" with "Tiffany"
  And I fill in "Your E-mail" with "thlam@berkeley"
  And I press "Create Event"
  Then I should see "Pottery Painting Night was successfully created."
  
Scenario: missing a required fields
  Given I am on the New Event page
  And I press "Create Event"
  Then I should see "You have not filled out all required fields."
  
  