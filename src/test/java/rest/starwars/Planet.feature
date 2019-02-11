@ignore
Feature: re-usable feature to get a planet

Scenario:

Given url "https://swapi.co/api"
  And path planetPath
When method GET
Then status 200