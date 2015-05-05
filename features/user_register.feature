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

Scenario: add user
  Given I am on the user page
  And I follow "add_user_submit"
  Then I should see "Add New User"
  And I fill in "user_uname" with "bada"
  And I fill in "user_password" with "9999"
  And I press "add_submit"
  Then I should see "bada was successfully created."
  
Scenario: delete user
  Given I am on the user page
  And I follow "delete_submit_adam"
  Then I should see "User 'adam' deleted."
  
Scenario: user login
  Given I am on all page
  
Scenario: user login
  Given I am on all page