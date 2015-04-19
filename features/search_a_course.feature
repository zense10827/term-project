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
  
  Given the following instructor exist:
  | TID       | instructor_name  | major        | 
  | 5501      | Sam Smith        | Computer     | 

Scenario: search CN201 by SID (happy path)
  When I go to the search page
  And I select "SID" from "by"
  And I fill in "name" with "CN201"
  And I press "search_submit"
  Then I should see "Java OOP"

Scenario: search CN999 by SID (SAD path)
  When I go to the search page
  And I select "SID" from "by"
  And I fill in "name" with "CN999"
  And I press "search_submit"
  Then I should see "Not Found"
  
Scenario: search Java OOP by name (happy path)
  When I go to the search page
  And I select "name" from "by"
  And I fill in "name" with "Java OOP"
  And I press "search_submit"
  Then I should see "CN201"

Scenario: search CN999 by name (SAD path)
  When I go to the search page
  And I select "name" from "by"
  And I fill in "name" with "CN999"
  And I press "search_submit"
  Then I should see "Not Found"