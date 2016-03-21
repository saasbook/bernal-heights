Feature: View Hotspots as Admin
  As an admin
  I want to see all hotspot listed
  So that I can better coordinate hotspot walks

Background: 
  Given I am signed in as an admin
  Given the following hotspots exist:
  | issue_type       | location                         | details             | creator_name    | creator_email     | creator_number      |
  | Car break-in     | Courtland and Hollyoak           | lorem ipsum         | Test            | test@test.com     | (415) 123-45678     |
  | Streetlight      | 123456N, 3495902E                | broken streetlight  | Test            | test@test.com     | (415) 123-45678     | 
  | Drug dealing     | The empty lot near the library   | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed lobortis lacus. Donec velit neque, porttitor quis facilisis nec, volutpat sed ante. Vivamus a malesuada sem. Cras urna magna, venenatis vel erat id, euismod molestie odio. Curabitur tempor erat sit amet magna dapibus, vitae pellentesque risus aliquet. | Test            | test@test.com     | (415) 123-45678     | 

Scenario: View all Hotspots
  When I am on the admin home page
  And I follow "View Hotspot Forms"
  Then I should see "Car break-in"
  And I should see "Streetlight"
  And I should see "Drug dealing"

  
  