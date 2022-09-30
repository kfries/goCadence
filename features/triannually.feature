Feature: Daily Cadence Object

  In order to handle items that occur on a tri-annually basis
  As a developer
  I want to create an instance of Cadence that can handle tri-annually occurances

  Background:
    Given a new TRIANNUALLY cadence object
    And the date is 2022-04-04

  Scenario: Verify its weighting value
    Then its value whould be 252

  Scenario: Verity its string value
    Then its string value should be "tri-annually"

  Scenario: Veryify is description value
    Then its description should be "three times per year"

  Scenario: How many times does TRIANNUALLY occur in TREANNUALLY
    Given a second cadence of TREANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 9.0

  Scenario: How many times does TRIANNUALLY occur in SEMIANNUALLY
    Given a second cadence of SEMIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.500000

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2022-08-04

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2023-04-04
