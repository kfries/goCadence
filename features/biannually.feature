Feature: Daily Cadence Object

  In order to handle items that occur on a bi-annually basis
  As a developer
  I want to create an instance of Cadence that can handle bi-annually occurances

  Background:
    Given a new BIANNUALLY cadence object
    And the date is 2022-04-04

  Scenario: Verify its weighting value
    Then its value whould be 42

  Scenario: Verity its string value
    Then its string value should be "bi-annually"

  Scenario: Veryify is description value
    Then its description should be "every two years"

  Scenario: How many times does BIANNUALLY occur in BIANNUALLY
    Given a second cadence of BIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.0

  Scenario: How many times does BIANNUALLY occur in TREANNUALLY
    Given a second cadence of TREANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.500000

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2024-04-04

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2028-04-04
