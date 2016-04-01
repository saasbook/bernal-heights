Feature: administrator login

  As the administrator
  I want to login 
  So that I can moderate events and view hotspot form submissions.

# Successful log in as an admin and see the admin-control actions on dashboard
Scenario: Successfully logged on as an administrator
  Given I am signed in as an admin
  Then I should be on the admin dashboard page
  And I should see "Confirm New Events"
  And I should see "View Hotspot Forms"

# Successful log in as non-admin user and gets redirected to events page
Scenario: Successful log in using seeded admin account
  Given I am signed in as a non-admin
  Then I should see "All Events"
  And I should see "Create new event"


# Extra tests // testing random things related to admin-login
# admin following approve events link should bring them to a page to show all events

# Succesful log in with seeded admin account // is that possible??
  # When I fill in "Email" with ENV['ADMIN_EMAIL']
  # When I fill in "Password" with ENV['ADMIN_PASSWORD']
  # And I press "Log in"
  # Then "I should be on the admin dashboard page" 