Feature: administrator login

  As the administrator
  I want to login 
  So that I can moderate events and view hotspot form submissions.
  
Scenario: Successfully logged into Google account
#need to fill in correct acct info and need to add privilege granting step
  Given I am on the home page
  When I press "Login with Google"
  Then I should be on the Google Login page
  When I fill in "email" with "admin1@google.com"
  And I fill in "password" with "admin1password"
  And I press "Sign in"
  Then I should be on the admin home page
  And I should see "Welcome, admin1"
  # add admin dashboard features here
  And I should see "Confirm New Events"
  And I should see "View Hotspot forms"

Scenario: Unsuccessful log in to Google account

  Given I am on the home page
  When I press "Login with Google"
  Then I should be on the Google Login page
  When I fill in "email" with "admin1@google.com"
  And I fill in "password" with "wrongpassword"
  And I press "Sign in"
  Then I should be on the Google Login page
  And I should see "The email and password you entered don't match."