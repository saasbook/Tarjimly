Feature: View Requests

  Scenario: Translator views request details
    Given I am on the "translators/requests" page
    And I click on "View Request" from the list of request
    Then I should see "English" and "Arabic"
