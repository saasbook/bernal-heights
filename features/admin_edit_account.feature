Feature:
  As an admin for the site
  I want to be able to update my information
  So that if it is outdated or compromised I can fix it.
  
Background:
  Given the following admins exist:
    | name               | email                | password          |
    | Celty Sturlson     | dullahan@drrr.com    | headlessrider     |
    | Kishitani Shinra   | ilovecelty@drrr.com  | unrequitedlove    |
    | Heiwajima Shizuo   | izayaaakun@drrr.com  | peacefulisland    |

Scenario: Admin can reach edit account info from admin home page
  Given I am signed in as an admin
  When I am on the admin home page page
  And I follow "Edit Account"
  Then I should be on the edit account info page

Scenario: Non-admins cannot reach edit account info
  Given I am signed out
  When I go to the edit account info page
  Then I should see "You must sign in as an administrator to see this page"
  And I should be on the sign in page

Scenario: Invalid email
  Given I am signed in with email: "dullahan@drrr.com" and password: "headlessrider"
  When I update my email to "notanemail"
  Then I should see "Not a valid email"
  And I can log in with email: "dullahan@drrr.com" and password: "headlessrider"
  And I cannot log in with email: "notanemail" and password: "headlessrider"

Scenario: Update email successfully
  Given I am signed in with email: "dullahan@drrr.com" and password: "headlessrider"
  When I update my email to "blackrider@drrr.com"
  Then I should see "Email updated to blackrider@drrr.com"
  And I can log in with email: "blackrider@drrr.com" and password: "headlessrider"
  And I cannot log in with email: "dullahan@drrr.com" and password: "headlessrider"

Scenario: Invalid new password
  Given I am signed in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"
  When I provide old password "unrequitedlove" to update my password to "fail"
  Then I should see "Password is too short (minimum is 8 characters)"
  And I can log in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"
  And I cannot log in with email: "ilovecelty@drrr.com" and password: "fail"

Scenario: Incorrect old password verification
  Given I am signed in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"
  When I provide old password "wrong_password" to update my password to "failboat" 
  Then I should see "Current password is invalid"
  And I can log in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"
  And I cannot log in with email: "ilovecelty@drrr.com" and password: "failboat"
  
Scenario: Update password successfully
  Given I am signed in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"
  When I provide old password "unrequitedlove" to update my password to "celtysfiance" 
  Then I should see "Password updated!"
  And I can log in with email: "ilovecelty@drrr.com" and password: "celtysfiance"
  And I cannot log in with email: "ilovecelty@drrr.com" and password: "unrequitedlove"

Scenario: Update name successfully
  Given I am signed in with email: "izayaaakun@drrr.com" and password: "peacefulisland"
  When I go to the admin home page page
  Then I should see "Welcome back, Heiwajima Shizuo"
  
  When I update my name to "Shizu-chan"
  Then I should see "Name updated to Shizu-chan"
  
  When I go to the admin home page page
  Then I should see "Welcome back, Shizu-chan"
  And I should not see "Heiwajima Shizuo"
  
