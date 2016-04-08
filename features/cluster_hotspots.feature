Feature: Cluster Hotspot Markers
  As a neighbor
  I want to be able to indicate that my hotspot is the same as another reported hospot
  So that the map won't be filled with an abundance of overlapping markers

Background: 
  Given the following hotspots exist:
  | issue_type       | location                         | details             | creator_name    | creator_email     | creator_number      |
  | Streetlight      | 515 Cortland Ave                 | lorem ipsum         | Test            | test@test.com     | (415) 123-45678     |
  | Drug dealing     | 515 Cortland Ave                 | lorem ipsum         | Test            | test@test.com     | (415) 123-45678     |
  | Streetlight      | 515 Cortland Ave                 | broken streetlight  | Test            | test@test.com     | (415) 123-45678     | 
  | Drug dealing     | The empty lot near the library   | Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed lobortis lacus. Donec velit neque, porttitor quis facilisis nec, volutpat sed ante. Vivamus a malesuada sem. Cras urna magna, venenatis vel erat id, euismod molestie odio. Curabitur tempor erat sit amet magna dapibus, vitae pellentesque risus aliquet. | Test            | test@test.com     | (415) 123-45678     | 

Scenario: See one hotspot marker for hotspot forms with the exact same location and issue type
  When I am on the admin dashboard page
  And I follow "View Hotspot Forms"
  Then I should only see unique hotspots
  
Scenario: See one hotspot marker for hotspot forms within one block radius from each other and have same issue type
  When I am on the admin dashboard page
  And I follow "View Hotspot Forms"
  Then I should see overlapping hotspots as one hotspot
