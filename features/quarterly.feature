Feature: Daily Cadence Object

  In order to handle items that occur on a quarterly basis
  As a developer
  I want to create an instance of Cadence that can handle quarterly occurances

  Background:
    Given a new QUARTERLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 336

  Scenario: Verity its string value
    Then its string value should be "quarterly"

  Scenario: Veryify is description value
    Then its description should be "four times per year"

  Scenario: How many times does QUARTERLY occur in ANNUALLY
    Given a second cadence of ANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 4.0

  Scenario: How many times does QUARTERLY occur in TRiANNUALLY
    Given a second cadence of TRiANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.333333
