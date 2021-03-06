Feature: add a course to database

  As a admin
  So that I can share a course
  I want to add a course to course database

Background: course in database
  
  Given the following course exist:
  | SID       | TID  | name      | semester | about | section | curriculum | available |
  | CN201     | 5501 | Java OOP  |  1       | ruby  |  001    |   2555     |  No       |
  | CN202     | 5501 | Data 1    |  1       | ruby  |  002    |   2552     |  No       |
  | CN409     | 5502 | Crypto 2  |  2       | ruby  |  001    |   2552     |  Yes      |
  | CN320     | 5503 | Soft Eng  |  2       | ruby  |  002    |   2552     |  Yes      |
  | CN340     | 5504 | Network   |  1       | ruby  |  001    |   2555     |  No       |
  | CN342     | 5503 | Database  |  1       | ruby  |  001    |   2555     |  No       |
  | CN408     | 5505 | Cloud     |  2       | ruby  |  002    |   2555     |  Yes      |
  | CN341     | 5505 | OS        |  1       | ruby  |  002    |   2552     |  No       |
  | CN418     | 1    | Parallel  |  2       | ruby  |  001    |   2552     |  Yes      |

  Given the following schedules exist:
  | day       | duration  | start_hr    | start_min   | course_id |
  | 1         | 90        | 8           | 0           |  9        |
  | 3         | 180       | 9           | 30          |  2        |

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
  | admin        | 1234          |
  
  Given I go to the login page
    And  I fill in "uname" with "admin"
    And  I fill in "password" with "1234"
    And  I press "login_submit"
  

Scenario: add a course to database (happy path)
  When I go to the add page
  And  I fill in "course_SID" with "CN301"
  And  I fill in "course_name" with "Data 2"
  And  I select "2" from "course_semester"
  And  I fill in "course_curriculum" with "1998"
  And  I fill in "course_about" with "Data & Algorithm 2"
  And  I select "Yes" from "course_available"
  And  I select "Tuesday" from "schedule_day"
  And  I select "8" from "schedule_start_hr"
  And  I select "00" from "schedule_start_min"
  And  I fill in "schedule_duration" with "180"
  And  I press "add_submit"
  Then I should see "CN301 was successfully created."

Scenario: add a course to database (sad path)
  When I go to the add page
  And  I fill in "course_name" with "Algorithm"
  And  I select "2" from "course_semester"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in SID
  
Scenario: add a course to database (sad path)
  When I go to the add page
  And  I fill in "course_SID" with "CN990"
  And  I select "2" from "course_semester"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in name
  
Scenario: add a course to database (sad path)
  When I go to the add page
  And  I fill in "course_SID" with "CN990"
  And  I fill in "course_name" with "Algorithm"
  And  I press "add_submit"
  Then I should see "ERROR"
  #no input in semester
  
Scenario: view course information
  Given I am on all page
  And I follow "info_submit_CN418"
  Then I should see "Details about Parallel"

Scenario: delete a course in database
  Given I am on all page
  And I follow "delete_submit_CN418"
  Then I should see "Course 'CN418' deleted."