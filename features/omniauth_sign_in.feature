Feature:
  As a community member
  I want to be able to login with FB
  So that I can easily contribute to the site

@omniauth_test
Scenario: User login through facebook

  Given I am on the sign in page
  # When I follow "Sign in with Facebook"
  Then I am signed in with provider "Facebook"
  And I should be on the admin dashboard page