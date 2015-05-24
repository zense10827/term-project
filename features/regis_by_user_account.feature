Feature: add a course to database

  As a student (sam)
  So that I can regis the course which has exit.
  

Background: course in database
  
  Given the following course exist:
  | SID       | TID  | name      | semester | about | section | curriculum | available |
  | CN341     | 2    | OS        |  1       | ruby  |  002    |   2552     |  Yes      |

  Given the following schedules exist:
  | day       | duration  | start_hr    | start_min   | course_id |
  | 1         | 90        | 8           | 0           |  1        |

  Given the following instructor exist:
  | TID       | instructor_name  | major        | 
  |  2        | Sam Smith        | Computer     | 
  |  2        | Frank Lampard    | Electrical   |  

  Given the following user exist:
  | uname        | password      |
  | sam          | 1234          |
  | admin        | 1234          |
  
  Given I go to the login page
    And  I fill in "uname" with "sam"
    And  I fill in "password" with "1234"
    And  I press "login_submit"

Scenario: sam register CN341 (happy path)
  When I go to the timetable page
  And  I select "CN341: OS" from "study_course_id"
  And  I press "regis_submit"
  Then I should see "sam registered CN341"
  And  I press "view_submit"
  Then I should see "OS"
  
Scenario: sam register CN341 (sad path)
  When I go to the timetable page
  And  I select "Please select" from "study_course_id"
  And  I press "regis_submit"
  Then I should see "ERROR Please select"
  #didn't select course