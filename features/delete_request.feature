Feature: delete a requested translation

    As a User
    So that I know I have succesfully deleted a requested
    I want to no longer see the doccument in my "Pending Transactions" tab

    Background: current pending transactions


    Scenario: successfully deleting a translation
        When I go to my page for "Pending Transactions"
        And I go to the edit page for ""