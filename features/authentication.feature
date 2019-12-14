Feature: existing tarjimly users should be able to log into TarjimlyDocs

    Scenario: Translators can log in and log out
        Given I go to the "Home" page
        When I fill in "email" with "cassidyhardin@berkeley.edu" and "password" with "tarjimlydocs19"
        And I click the "Login" button
        Then I should be on the "/claims" path
        And I select "Sign Out"
        Then I should be on the "Home" page


    Scenario: Aid Workers can log in and log out
        Given I go to the "Home" page
        When I fill in "email" with "cassihardin@gmail.com" and "password" with "tarjimlydocs19"
        And I click the "Login" button
        Then I should be on the "/requests" page
        And I select "Sign Out"
        Then I should be on the "Home" page

    Scenario: Incorrect Password
        Given I go to the "Home" page
        When I fill in "email" with "cassihardin@gmail.com" and "password" with ""
        And I click the "Login" button
        Then I should be on the "/" path
        Then I should see "Unsucessful login, please try again."
