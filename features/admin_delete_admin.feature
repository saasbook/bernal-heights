Feature:
  As a superadmin
  I want to be able to delete admin accounts
  So that people no longer working as staff don't continue to have access

Background:
  Given the following admins exist:
  | name               | email                | password          | admin  |
  | Celty Sturlson     | dullahan@drrr.com    | headlessrider     | true   |
  | Kishitani Shinra   | ilovecelty@drrr.com  | unrequitedlove    | false  |
  | Heiwajima Shizuo   | izayaaakun@drrr.com  | peacefulisland    | true   |
  | Orihara Izaya      | shizuchan@drrr.com   | ilovehumans       | false  |
  
@javascript  
Scenario: Superadmins can have option to delete accounts
  Given I am signed in as an admin
  When I go to the view all admins page
  And I delete the account for "Orhihara Izaya"
  When I go to the view all admins page
  Then I should not see "Orihara Izaya"

@javascript
Scenario: Cancel deleting account
  Given I am signed in as an admin
  When I go to the view all admins page
  And I do not delete the account for "Heiwajima Shizuo"
  When I go to the view all admins page
  Then I should see "Heiwajima Shizuo"
  
Scenario: Superadmins cannot delete their own accounts
  Given I am signed in with email: "dullahan@drrr.com" and password: "headlessrider"
  When I go to the view all admins page
  Then I should not see "Delete Account" within "#celty_sturlson"
  And I should see "Delete Account" within "#kishitani_shinra"

Scenario: Admins without superadmin permissions cannot delete accounts
  Given I am signed in with email: "shizuchan@drrr.com" and password: "ilovehumans"
  When I go to the view all admins page
  Then I should see "Heiwajima Shizuo"
  And I should not see "Delete Account"

Scenario: Non-admins should not be able to access the manage admin page at all
  Given I am signed out
  When I go to the view all admins page
  Then I should see "You must be an administrator to see this page"
  And I should be on the sign in page
  