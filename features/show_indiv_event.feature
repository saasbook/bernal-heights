Feature:
  As a neighbor
  I want to be able to view all associated details of a calendar event
  So that I can painlessly partake in activities happening in the community
Background:
  Given an event titled "Library Movie Night" exists
  
Scenario: Show Individual Event
  When I go to the events page
  When I follow "Library Movie Night"
  Then I should see all the event information for "Library Movie Night"
