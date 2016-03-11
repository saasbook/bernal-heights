Feature: Moderate event

  As an admin, 
  I want to be able to see a list of events created/submitted by community members and confirm the appropriate ones, 
  So that the calendar is not cluttered with unnecessary information.
    
Scenario: See all unconfirmed events

  Given I am on the admin unconfirmed events page
  Then I should see "all unconfirmed events"
  And not "confirmed events"
    
Scenario: Confirm an event

  Given I am on the admin unconfirmed events page
  When I press "confirm" within an event
  Then I should see "event approved"
    
Scenario: Reject an event

  Given I am on the admin unconfirmed events page
  When I press "reject" within an event
  Then I should see "event rejected"
    
#Scenario: See all confirmed events