Feature: delete a requested translation

    As a User
    So that I know I have succesfully deleted a requested
    I want to no longer see the doccument in my "Pending Translations" tab

    Background: current pending transactions

        Given the following requests exist:
            | user_tarjimly_id | from_language | to_language | document | document_format | deadline   | title                  | description | categories    | num_claims | form_type | _status |
            | 1                | English       | Arabic      | location | pdf             | 2019-11-09 | Camp Announcment       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 1                | English       | Urdu        | location | pdf             | 2019-11-10 | Camp Announcment Flyer | information | Refugee, Camp | 0          | N/A       | 0       |
            | 1                | Arabic        | English     | location | pdf             | 2019-12-09 | Visa Application       | information | Visa          | 2          | Visa      | 0       |
            | 1                | Urdu          | English     | location | pdf             | 2019-11-01 | Doctor Notes           | information | Child, Doctor | 1          | N/A       | 0       |

        Given the following claims exist:
            | translator_tarjimly_id | _status | submitted_date | translation | translation_type | request_id |
            | 142                    | 0       | Arabic         | location    | pdf              | 1          |
            | 142                    | 0       | Urdu           | location    | pdf              | 3          |
            | 98                     | 0       | English        | location    | pdf              | 1          |
            | 14                     | 0       | English        | location    | pdf              | 2          |

#     Scenario: visiting user's pending transactions
#         Given I go to my "Requests" page
#         Then I should see "Pending Translations" and "Completed Translations"
#     # When I click "Pending Translations"

#     Scenario: successfully deleting a translation
#         Given I go to my "Requests" page
# # When I click "Pending Translations"
#     When I click "Camp Announcment"
#     Then I should see "Delete Request"
#     And I click "Delete Request"
#     Then I should see "Are you sure you want to delete this request?"
#     When I click "Yes"
#     Then I should see "Your request Camp Announcment has been deleted!"
#     When I am on my "Pending Transactions" page
#     Then I should not see "Camp Announcment"

# Scenario: successfully deleting a translation
#     Given I go to my "Requests" page
#     When I click "Pending Translations"
#     When I click "Camp Announcment"
#     Then I should see "Delete Request"
#     And I click "Delete Request"
#     Then I should see "Are you sure you want to delete this request?"
#     When I click "No"
#     Then I should see "Your request has not been deleted"
#     Then I should be on "Camp Announcment" page
#     When I go to my "Requests" page
#     Then I should see "Camp Announcment"