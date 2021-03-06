Feature:
  As an admin
  I want to be able to create more admin accounts
  So that new staff can manage the app

Scenario: Non-admins cannot access the add new admin page
  Given I am signed out
  When I go to the add new admin page
  Then I should see "You must be an administrator to see this page"
  And I should be on the sign in page

Scenario: Successfully create new admin
  Given I am signed in as an admin
  When I register an admin with name: "Sawamura Daichi", email: "captain@karasuno.org" and password: "wingspiker"
  Then I should see "New staff account created for Sawamura Daichi"
  And I should be on the view all admins page
  And I should see "Sawamura Daichi"
  
  Given I am signed out
  Then I can log in with email: "captain@karasuno.org" and password: "wingspiker"
  And I should see "Welcome back, Sawamura Daichi"

Scenario: Invalid email
  Given I am signed in as an admin
  When I register an admin with name: "Sugawara Koushi", email: "notanemail" and password: "vicecaptain"
  Then I should see "is invalid"
  
  When I go to the view all admins page
  Then I should not see "Sugawara Koushi"
  And I cannot log in with email: "notanemail" and password: "vicecaptain"
  
Scenario: Invalid password
  Given I am signed in as an admin
  When I register an admin with name: "Sugawara Koushi", email: "vicecaptain@karasuno.org" and password: "fail"
  Then I should see "is too short (minimum is 8 characters)"
  
  When I go to the view all admins page
  Then I should not see "Sugawara Koushi"
  And I cannot log in with email: "vicecaptain@karasuno.org" and password: "fail"

Scenario: Account with registered email already exists
  Given I am signed in as an admin
  When I register an admin with name: "Sugawara Koushi", email: "vicecaptain@karasuno.org" and password: "teammother"
  When I register an admin with name: "Second Suga", email: "vicecaptain@karasuno.org" and password: "setterforlife"
  Then I should see "has already been taken"
  
  And I can log in with email: "vicecaptain@karasuno.org" and password: "teammother"
  And I cannot log in with email: "vicecaptain@karasuno.org" and password: "setterforlife"

  