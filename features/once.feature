Feature: Daily Cadence Object

  In order to handle items that occur on a once basis
  As a developer
  I want to create an instance of Cadence that can handle once occurances

  Background:
    Given a new ONCE cadence object

  Scenario: Verify its weighting value
    Then its value whould be 0

  Scenario: Verity its string value
    Then its string value should be "once"

  Scenario: Veryify is description value
    Then its description should be "one time only"

  Scenario: How many times does ONCE occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.0

  Scenario: How many times does ONCE occur in MONTHLY
    Given a second cadence of MONTHLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.0
