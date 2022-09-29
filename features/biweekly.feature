Feature: Daily Cadence Object

  In order to handle items that occur on a bi-weekly basis
  As a developer
  I want to create an instance of Cadence that can handle bi-weekly occurances

  Background:
    Given a new BIWEEKLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 2190

  Scenario: Verity its string value
    Then its string value should be "bi-weekly"

  Scenario: Veryify is description value
    Then its description should be "every two weeks"

  Scenario: How many times does BIWEEKLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 6.0

  Scenario: How many times does BIWEEKLY occur in ANNUALLY
    Given a second cadence of ANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 26.071429
