# Feature: View Filtered Requests

#   Background:  translations

#     Given I am signed in as a translator

#   Scenario: Translator views request filtered by language
#     Given I am on the "translators/requests" page
#     When I select "English" from "from_language"
#     And I select "Arabic" from "to_language"
#     And I click the "Filter" button
#     Then I should see "English"
#     And I should see "Arabic"
#     And I should not see "French"
