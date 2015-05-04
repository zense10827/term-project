Feature: add instructor to course

  As a admin
  So that I can add instructor
  I want to add instructor to course 

Background: instructor in course database
  
  Given the following instructor exist:
  | TID       | instructor_name  | major        | 
  |  1        | Sam Smith        | Computer     | 
  |  2        | Frank Lampard    | Electrical   |  
  |  3        | Steven Gerrard   | Chemical     |
  |  4        | Jonh Terry       | Mechanical   |

  Given the following user exist:
  | uname        | password      |
  | sam          | 1234          |
  | frank        | 5678          |
  | stev         | bobby555      |
  | john         | meaw9999      |


Scenario: add a course to database (happy path)
  When I go to the add instructor page
  And  I fill in "instructor_TID" with "5501"
  And  I fill in "instructor_instructor_name" with "Diago Costa"
  And  I fill in "instructor_major" with "Civil"
  And  I press "add_submit"
  Then I should see "5501 was successfully created."

Scenario: add a course to database (sad path)
  When I go to the add instructor page
  And  I fill in "instructor_TID" with "5501"
  And  I fill in "instructor_instructor_name" with "Diago Costa"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in major

Scenario: add a course to database (sad path)
  When I go to the add instructor page
  And  I fill in "instructor_instructor_name" with "Diago Costa"
  And  I fill in "instructor_major" with "Civil"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in TID
  
Scenario: add a course to database (sad path)
  When I go to the add instructor page
  And  I fill in "instructor_TID" with "5501"
  And  I fill in "instructor_major" with "Civil"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in instructor_name
  
Scenario: delete a course database
  Given I am on view instructor page
  And I follow "delete_submit_Sam Smith"
  Then I should see "Instructor 'Sam Smith' deleted."