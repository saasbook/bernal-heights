Feature: report an issue as a resident of bernal heights

  As a resident of the bernal heights neighborhood
  I want to report that the street light near my house is broken
  so it can be fixed by the appropriate city department and it would be safe for me and my fellow neighbors to get around after sunset.

Background: go to the form page
  # write steps here to navigate to the form page
  # And I am on the HotSpot Form page

Scenario: reporting an issue with all fields filled
  # your steps here // edit here
  Given I select "Street Light"
  And I check "burned out"
  Then I fill in "Address" with "245 College Ave, San Francisco, CA 94112"
  And I fill in "Time of occurence" with "2:45PM on 02/05/2016"
  And I fill "Other details" with "None"
  And I fill "Reported to Police" with "N/A"
  Then I select "no" to "sharing my information"
  And When I press "submit_form"
  Then I should see "Issue has been submitted. Thank you!"


Scenario: reporting an issue missing some mandatory fields (i.e. other details)
  # your steps here 
  Given I select "Street Light"
  And I check "burned out"
  Then I fill in "Address" with "245 College Ave, San Francisco, CA 94112"
  And I fill in "Time of occurence" with "2:45PM on 02/05/2016"
  Then I select "yes" to "sharing my information"
  And I fill in "User_Name" with "John Smith"
  And I fill in "User_Add" with "123 College Ave, SF, CA 94112"
  And I fill in "User_Number" with "(415)-123-4567"
  And I fill in "User_Email" with "johnsmith@gmail.com"
  And I fill in "Time to contact" with "Evening by phone"
  And When I press "submit_form"
  Then I should see "Issue has been submitted. Thank you!"

# Following secanaris may be added in the future
# Scenario: reporting an issue via geotags
  # write your steps here

# Scenario: reporting an issue via clicking on map coordinates/dropping pin
  # write your steps here