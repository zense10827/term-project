Feature: edit a course in database
  
  As a admin
  So that I can edit a course
  I want to edit a course in course database

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
  
  Given the following instructor exist:
  | TID       | instructor_name  | major        | 
  | 5501      | Sam Smith        | Computer     | 


Scenario: see information (happy path)
  When I am on all page
  And  I follow "info_submit_CN418"
  Then I should see "Details about Parallel"
  And I follow "edit_submit_CN418"
  And I select "2" from "course_semester"
  And I press "edit_submit"
  Then I should see "CN418 was successfully edited."
  
Scenario: see information (bad path)
  When I am on all page
  And  I follow "info_submit_CN418"
  Then I should see "Details about Parallel"
  And I follow "edit_submit_CN418"
  And I select "Please select" from "course_semester"
  And I press "edit_submit"
  Then I should see "ERROR"