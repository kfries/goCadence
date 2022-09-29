Feature: Daily Cadence Object

  In order to handle items that occur on a quad-weekly basis
  As a developer
  I want to create an instance of Cadence that can handle quad-weekly occurances

  Background:
    Given a new QUADWEEKLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 1095

  Scenario: Verity its string value
    Then its string value should be "quad-weekly"

  Scenario: Veryify is description value
    Then its description should be "every four weeks"

  Scenario: How many times does QUADWEEKLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 3.0

  Scenario: How many times does QUADWEEKLY occur in MONTHLY
    Given a second cadence of MONTHLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.086310
