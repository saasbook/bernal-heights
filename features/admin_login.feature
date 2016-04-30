Feature: administrator login

  As the administrator
  I want to login 
  So that I can moderate events and view hotspot form submissions.

# Successful log in as an admin and see the admin-control actions on dashboard
Scenario: Successfully logged on as an administrator
  Given I am an admin with name: "Fantastic Mr. Fox"
  When I sign in as an admin named "Fantastic Mr. Fox"
  Then I should be on the admin home page
  And I should see "Welcome back, Fantastic Mr. Fox!"
  
Scenario: Unsuccessfully logged in
  Given I am on the sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345679"
  And I press "Log in"
  Then I should be on the sign in page