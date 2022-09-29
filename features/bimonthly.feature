Feature: Daily Cadence Object

  In order to handle items that occur on a bi-monthly basis
  As a developer
  I want to create an instance of Cadence that can handle bi-monthly occurances

  Background:
    Given a new BIMONTHLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 504

  Scenario: Verity its string value
    Then its string value should be "bi-monthly"

  Scenario: Veryify is description value
    Then its description should be "every two months"

  Scenario: How many times does BIMONTHLY occur in TRIANNUALLY
    Given a second cadence of TRIANNUALLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 2.0

  Scenario: How many times does BIMONTHLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 1.380822
