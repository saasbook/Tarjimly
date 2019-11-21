Feature: Claim Request

  Scenario: Translator starts a new claim
    Given I am on the "translators/requests" page
    When I click on "Claim" from the list of request
    Then I should be able to find the claim by my id
