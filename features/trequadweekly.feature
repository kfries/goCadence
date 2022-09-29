Feature: Daily Cadence Object

  In order to handle items that occur on a tre-quad-weekly basis
  As a developer
  I want to create an instance of Cadence that can handle tre-quad-weekly occurances

  Background:
    Given a new TREQUADWEEKLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 365

  Scenario: Verity its string value
    Then its string value should be "tre-quad-weekly"

  Scenario: Veryify is description value
    Then its description should be "every twelve weeks"

  Scenario: How many times does TREQUADWEEKLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.0

  Scenario: How many times does TREQUADWEEKLY occur in QUADWEEKLY
    Given a second cadence of QUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 0.333333
