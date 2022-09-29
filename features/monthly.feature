Feature: Daily Cadence Object

  In order to handle items that occur on a monthly basis
  As a developer
  I want to create an instance of Cadence that can handle monthly occurances

  Background:
    Given a new MONTHLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 1008

  Scenario: Verity its string value
    Then its string value should be "monthly"

  Scenario: Veryify is description value
    Then its description should be "once per month"

  Scenario: How many times does MONTHLY occur in ANNUALLY
    Given a second cadence of ANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 12.0

  Scenario: How many times does MONTHLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 2.761644
