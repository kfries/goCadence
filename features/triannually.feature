Feature: Daily Cadence Object

  In order to handle items that occur on a tri-annually basis
  As a developer
  I want to create an instance of Cadence that can handle tri-annually occurances

  Background:
    Given a new TRIANNUALLY cadence object

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
