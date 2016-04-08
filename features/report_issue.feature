@noauth
Feature: report an issue as a resident of bernal heights

  As a resident of the bernal heights neighborhood
  I want to report that the street light near my house is broken
  so it can be fixed by the appropriate city department and it would be safe for me and my fellow neighbors to get around after sunset.
  
Scenario: go to hotspot form page
  Given I am on the Hotspot form page
  Then I should see "New Hotspot Form"
 
Scenario: reporting an issue with all required fields filled 
  Given I am on the Hotspot form page
  When I select "Street Light" from "Type of Issue" 
  And I fill in "Location" with "266 Winfield St, San Francisco, CA 94110"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 7
  And I fill in "Details" with "There is a broken light on Winfield St. which is a problem at night because it makes the street very dimly lit."
  And I fill in "Your Name" with "Joyce Toh"
  And I fill in "Your Email" with "joycetoh@berkeley.edu"
  And I fill in "Your Phone Number" with "123-456-7890"
  And I press "Submit Hotspot Form"
  And I check "Will you walk with us?"
  Then I should see "You have successfully reported an issue. Thank you!"
  
Scenario: missing required fields
  Given I am on the Hotspot form page
  When I press "Submit Hotspot Form"
  Then I should see "You have not filled out all required fields."
  
Scenario: location not in Bernal Heights Neighborhood
  Given I am on the Hotspot form page
  Given I am on the Hotspot form page
  When I select "Car Break-In" from "Type of Issue" 
  And I fill in "Location" with "1988 Martin Luther King Jr. Way, Berkeley, CA 94704"
  And I select occurred time 09 PM, 30
  And I select occurred date 2016, March, 7
  And I fill in "Details" with "A car parked in front of the Trader Joe's has been broken into. Their windows are shattered and things stolen."
  And I fill in "Your Name" with "Joyce Toh"
  And I fill in "Your Email" with "joycetoh@berkeley.edu"
  And I fill in "Your Phone Number" with "123-456-7890"
  And I press "Submit Hotspot Form"
  And I check "Will you walk with us?"
  Then I should see "The location is not in Bernal Heights. Please provide an issue that is located in Bernal Heights."
  
  
