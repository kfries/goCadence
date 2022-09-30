Feature: Daily Cadence Object

  In order to handle items that occur on a annually basis
  As a developer
  I want to create an instance of Cadence that can handle annually occurances

  Background:
    Given a new ANNUALLY cadence object
    And the date is 2022-04-04

  Scenario: Verify its weighting value
    Then its value whould be 84

  Scenario: Verity its string value
    Then its string value should be "annually"

  Scenario: Veryify is description value
    Then its description should be "once per year"

  Scenario: How many times does ANNUALLY occur in TREANNUALLY
    Given a second cadence of TREANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 3.0

  Scenario: How many times does ANNUALLY occur in SEMIANNUALLY
    Given a second cadence of SEMIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 0.500000

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2023-04-04

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2025-04-04
