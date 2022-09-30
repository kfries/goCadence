Feature: Daily Cadence Object

  In order to handle items that occur on a semi-monthly basis
  As a developer
  I want to create an instance of Cadence that can handle semi-monthly occurances

  Background:
    Given a new SEMIMONTHLY cadence object
    And the date is 2022-04-04

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

  Scenario: What is the next date given our test date?
    When I call the next function with the test date
    Then i should get a date of 2022-04-15

  Scenario: What is the next date given our test date?
    Given the date is 2022-04-20
    When I call the next function with the test date
    Then i should get a date of 2022-04-30

  Scenario: What is the 3rd date given our test date?
    When I request the third occurance from the test date
    Then i should get a date of 2022-05-15
