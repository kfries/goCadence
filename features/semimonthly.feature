Feature: Daily Cadence Object

  In order to handle items that occur on a semi-monthly basis
  As a developer
  I want to create an instance of Cadence that can handle semi-monthly occurances

  Background:
    Given a new SEMIMONTHLY cadence object

  Scenario: Verify its weighting value
    Then its value whould be 2016

  Scenario: Verity its string value
    Then its string value should be "semi-monthly"

  Scenario: Veryify is description value
    Then its description should be "twice per month"

  Scenario: How many times does SEMIMONTHLY occur in QUARTERLY
    Given a second cadence of QUARTERLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 6.0

  Scenario: How many times does SEMIMONTHLY occur in TREQUADWEEKLY
    Given a second cadence of TREQUADWEEKLY
    When I ask how many times it is in this second cadence
    Then I should get a floating point value of 5.523288
