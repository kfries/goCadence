Feature: Administrative Tests
  In order allow developers to adjust to changing features
  As a developer
  I need to be able to get metadata about the library

  Scenario: Check lib Version
    When I call the version method
    Then it will return "0.0.3"
