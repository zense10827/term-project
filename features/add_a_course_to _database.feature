Feature: add a course to database

  As a admin
  So that I can share a course
  I want to add a course to course database

Background: course in database

  Given the following course exist:
  | cid       | tid    | name      | term |
  | cn201     | t01    | Java OOP  |  1   |
  | cn202     | t01    | Data 1    |  1   |
  | cn409     | t02    | Crypto 2  |  2   |
  | cn320     | t03    | Soft Eng  |  2   |
  | cn340     | t04    | Network   |  1   |
  | cn342     | t03    | Database  |  1   |
  | cn408     | t05    | Cloud     |  2   |
  | cn341     | t05    | OS        |  1   |
  | cn418     | t04    | Parallel  |  2   |

Scenario: add a course to database
  When I go to the add page
  And  I fill in "cid" with "cn301"
  And  I fill in "tid" with "t01"
  And  I fill in "name" with "Data 2"
  And  I fill in "term" with "2"
  And  I press "Add Course"
  Then I should see "Course 'cn301' Added."
