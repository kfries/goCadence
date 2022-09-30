Feature: Daily Cadence Object

  In order to handle items that occur on a semi-annually basis
  As a developer
  I want to create an instance of Cadence that can handle semi-annually occurances

  Background:
    Given a new SEMIANNUALLY cadence object
    And the date is 2022-04-04

  Scenario: Verify its weighting value
    Then its value whould be 168

  Scenario: Verity its string value
    Then its string value should be "semi-annually"

  Scenario: Veryify is description value
    Then its description should be "twice per year"

  Scenario: How many times does SEMIANNUALLY occur in BIANNUALLY
    Given a second cadence of BIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 4.0

  Scenario: How many times does SEMIANNUALLY occur in TRIANNUALLY
    Given a second cadence of TRIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 0.666667

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2022-10-04

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2023-10-04
