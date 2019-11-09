Feature: delete a requested translation

    As a User
    So that I know I have succesfully deleted a requested
    I want to no longer see the doccument in my "Pending Transactions" tab

    Background: current pending transactions

        Given the following requests exist:
            | user_tarjimly_id | from_language | to_language | document | document_format | deadline   | title                  | description | categories    | num_claims | form_type | _status |
            | 234              | English       | Arabic      | location | pdf             | 2019-11-09 | Camp Announcment       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 234              | English       | Urdu        | location | pdf             | 2019-11-09 | Camp Announcment Flyer | information | Refugee, Camp | 0          | N/A       | 0       |
            | 234              | Arabic        | English     | location | pdf             | 2019-11-09 | Visa Application       | information | Visa          | 2          | Visa      | 0       |
            | 234              | Urdu          | English     | location | pdf             | 2019-11-09 | Doctor Notes           | information | Child, Doctor | 1          | N/A       | 0       |

    Scenario: visiting user's pending transactions
        Given I am on my "Requests" page
        Then I should see "Pending Transactions" and "Completed Transactions"
        And I click "Pending Transactions"
        Then I should see a list of "Pending Transactions" sorted by "deadline"


    Scenario: successfully deleting a translation
        Given I am on my "Pending Transactions" page
        When I go to the edit page for "Camp Announcment"
        Then I should see "Delete Request"
        And I click "Delete Request"
        Then I should see "Are you sure you want to delete this request?"
        When I click "Yes"
        Then I should see "Your request has been deleted!"
        When I am on my "Pending Transactions" page
        Then I should not see "Camp Announcment"

    Scenario: successfully deleting a translation
        Given I am on my "Pending Transactions" page
        When I go to the edit page for "Camp Announcment Flyer"
        Then I should see "Delete Request"
        And I click "Delete Request"
        Then I should see "Are you sure you want to delete this request?"
        When I click "No"
        Then I should see "Your request has not been deleted"
        When I am on my "Pending Transactions Flyer" page
        Then I should see "Camp Announcment"