Feature: existing tarjimly users should be able to log into TarjimlyDocs

    Scenario: Translators can log in
        Given I go to the "Home" page
        When I fill in "email" with "cassidyhardin@berkeley.edu" and "password" with "tarjimlydocs19"
        And I click the "Login" button
        Then I should be on the "/claims" path

    Scenario: Aid Workers can log in
        Given I go to the "Home" page
        When I fill in "email" with "cassihardin@gmail.com" and "password" with "tarjimlydocs19"
        And I click the "Login" button
        Then I should be on the "/requests" page

