Feature: Daily Cadence Object

  In order to handle items that occur on a tre-annually basis
  As a developer
  I want to create an instance of Cadence that can handle tre-annually occurances

  Background:
    Given a new TREANNUALLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 28

  Scenario: Verity its string value
    Then its string value should be "tre-annually"

  Scenario: Veryify is description value
    Then its description should be "every three years"

  Scenario: How many times does TREANNUALLY occur in TREANNUALLY
    Given a second cadence of TREANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.0

  Scenario: How many times does TREANNUALLY occur in BIANNUALLY
    Given a second cadence of BIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 0.666666
