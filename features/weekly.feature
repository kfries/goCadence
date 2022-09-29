Feature: Weekly Cadence Object

  In order to handle items that occur on a weekly basis
  As a developer
  I want to create an instance of Cadence that can handle events that occur once per week

  Background:
    Given a new WEEKLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 4380

  Scenario: Verity its string value
    Then its string value should be "weekly"

  Scenario: Veryify is description value
    Then its description should be "once per week"

  Scenario: How many times does WEEKLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 12.0

  Scenario: How many times does WEEKLY occur in ANNUALLY
    Given a second cadence of ANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 52.142857
