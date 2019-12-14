Feature: No Requests Exist
    Background: no requests to claim

        Given I am signed in as a translator

    Scenario: Translator starts a new claim
        Given I go to the "Translator Requests" page
        Then I should see "There are no pending requests at the moment. Please check back later!"