Feature: Add User
  
  As a All User Page
  So that I can see all users in database
  I want to see all add new user
  
Background: user in database
  
  Given the following user exist:
  | uname         | password      |
  | adam          | 1234          |
  | anna          | 5678          |
  | bobby         | bobby555      |
  | allcat        | meaw9999      |


Scenario: add user to database (happy path)
  When I go to the add user page
  And  I fill in "user_uname" with "john"
  And  I fill in "user_password" with "pw1234"
  And  I press "add_submit"
  Then I should see "john was successfully created."
  
Scenario: add user to database (sad path)
  When I go to the add user page
  And  I fill in "user_password" with "patterson"
  And  I press "add_submit"
  Then I should see "ERROR"
  
Scenario: add user to database (sad path)
  When I go to the add user page
  And  I fill in "user_uname" with "robert"
  And  I press "add_submit"
  Then I should see "ERROR"
  
Scenario: delete user in database
  Given I am on the user page
  And I follow "delete_submit_adam"
  Then I should see "User 'adam' deleted."