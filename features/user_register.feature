Feature: User Register
  
  As a All User Page
  So that I can see all users in database
  I want to see all course schedules
  
Background: user information in database
  
  Given the following studies exist:
  | user_id        | course_id     |
  | adam           | CN555         |
  | anna           | CN123         |
  | bobby          | BB987         |
  | allcat         | LZ777         |
  
  
  Given the following user exist:
  | uname         | password      |
  | adam          | 1234          |
  | anna          | 5678          |
  | bobby         | bobby555      |
  | allcat        | meaw9999      |


Scenario: go to timetable page
  Given I am on the user page
  And I follow "view_submit_adam"
  Then I should see "View Timetable adam"
  
  