Feature: Daily Cadence Object

  In order to handle items that occur on a daily basis
  As a developer
  I want to create an instance of Cadence that can handle daily occurances

  Background:
    Given a new DAILY cadence object
    And the date is 2022-04-04

  Scenario: Verify its weighting value
    Then its value whould be 30660

  Scenario: Verity its string value
    Then its string value should be "daily"

  Scenario: Veryify is description value
    Then its description should be "every day"

  Scenario: How many times does DAILY occur in WEEKLY
    Given a second cadence of WEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 7.0

  Scenario: How many times does DAILY occur in MONTHLY
    Given a second cadence of MONTHLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 30.416666

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2022-04-05

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2022-04-07
