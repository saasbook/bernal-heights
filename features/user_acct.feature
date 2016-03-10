Feature:

  As a Bernal Heights community member,
  I want to create an account and login
  So that I can favorite events and view the events I submitted.

Scenario: User successfully create an account
  
  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."
  And I should be on the events page

Scenario: Missing email during account creation

  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Email can't be blank"
  
Scenario: Missing password during account creation

  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I press "Sign up"
  Then I should see "Password can't be blank"

Scenario: Unmatched passwords during account creation

  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345679"
  And I press "Sign up"
  Then I should see "Password confirmation doesn't match Password"

Scenario: Password too short during account creation

  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "1234"
  And I fill in "Password confirmation" with "1234"
  And I press "Sign up"
  Then I should see "Password is too short"

Scenario: Invalid email format during account creation
  
  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Email is invalid"
  
Scenario: Email already in use during account creation

  Given I am on the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I press "Log out"
  When I go to the sign in page
  When I follow "Sign up"
  Then I should be on the sign up page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Email has already been taken"
  
#---------------------Login---------------------------------
  
Scenario: User login to website

  Given I am on the sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Signed in successfully."
  And I should be on the events page

Scenario: Wrong password during login

  Given I am on the sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345679"
  And I press "Log in"
  Then I should be on the sign in page
  #And I should see "Email and password don't match record."

Scenario: User login through facebook

  Given I am on the sign in page
  When I follow "Sign in with Facebook"
  Then I should be on the Facebook sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I press "Log In"
  Then I should be on the events page
  And I should see "Signed in successfully."

Scenario: Wrong password during login through facebook

  Given I am on the sign in page
  When I follow "Sign in with Facebook"
  Then I should be on the Facebook sign in page
  When I fill in "Email" with "user1@cucumbertest.com"
  And I fill in "Password" with "1234"
  And I press "Log In"
  Then I should see "The password you've entered is incorrect."

Scenario: User can't login without creating an account first
  
  Given I am on the sign in page
  When I fill in "Email" with "unregistereduser@cucumbertest.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should be on the sign in page
  #And I should see "No account found with this email."