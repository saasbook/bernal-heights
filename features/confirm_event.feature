Feature: Moderate event

  As an admin, 
  I want to be able to see a list of events created/submitted by 
  community members and confirm the appropriate ones, 
  so that the calendar is not cluttered with unnecessary information.
    
Scenario: See all unconfirmed events

  Given I am on "admin page for unconfirmed events"
  Then I should see "all unconfirmed events"
  And not "confirmed events"
    
Scenario: Confirm an event

  Given I am on "admin page for events"
  When I click "confirm" within an event
  Then I should see a "event approved"
    
Scenario: Reject an event

  Given I am on "admin page for events"
  When I click "reject" within an event
  Then I should see a "event rejected"
    
#Scenario: See all confirmed events