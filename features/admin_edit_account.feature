Feature:
  As an admin for the site
  I want to be able to update my information
  So that if it is outdated or compromised I can fix it.

Scenario: Admin can reach edit account info from admin dashboard
  Given I am signed in as an admin
  When I am on the admin dashboard
  And I follow "Edit Account Information"
  Then I should be on the edit account info page

Scenario: Non-admins cannot reach edit account info
  Given I am signed out
  When I visit the edit account info page
  Then I should see "Please log in to see this page"
  And I should be on the sign in page

Scenario: Update email successfully
  Given I am an admin with email: "admin@test.com" and password: "old_password"
  When I update my email to "newadmin@test.com"
  Then I should see "Email updated to newadmin@test.com"
  And I can log in with email: "newadmin@test.com" and password: "old_password"
  And I cannot log in with email: "admin@test.com" and password: "old_password"

Scenario: Update email fails
  Given I am an admin with email: "admin@test.com" and password: "old_password"
  When I update my email to "notanemail"
  Then I should see "Not a valid email"
  And I can log in with email: "admin@test.com" and password: "old_password"
  And I cannot log in with email: "notanemail" and password: "old_password"

Scenario: Update password successfully
  Given I am an admin with email: "admin@test.com" and password: "old_password"
  When I update my password to "new_password"
  Then I should see "Password updated!"
  And I can log in with email: "admin@test.com" and password: "new_password"
  And I cannot log in with email: "admin@test.com" and password: "old_password"

Scenario: Fail to update password
  Given I am an admin with email: "admin@test.com" and password: "old_password"
  When I update my password to "fail"
  Then I should see "Password must be 8 characters long"
  And I can log in with email: "admin@test.com" and password: "old_password"
  And I cannot log in with email: "admin@test.com" and password: "fail"

  
