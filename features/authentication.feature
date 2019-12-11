Feature: existing tarjimly users should be able to log into TarjimlyDocs

    Scenario: Translators can log in
        Given I go to the "Home" page
        Then I should see "Email"
        Then I should see "Password"
        When I fill in "Email" with "cassidyhardin@berkeley.edu" and "Password" with "tarjimlydocs19"
        And I click the "Sign In" button
        Then I should be on the "/claims" path

    Scenario: Aid Workers can log in
        Given I go to the "Home" page
        Then I should see "Email"
        Then I should see "Password"
        When I fill in "Email" with "cassihardin@gmail.com" and "Password" with "tarjimlydocs19"
        And I click the "Sign In" button
        Then I should be on the "/requests" path

