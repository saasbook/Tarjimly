Feature: delete a requested translation

    As a User
    So that I know I have succesfully deleted a requested
    I want to no longer see the doccument in my "Pending Translations" tab

    Background: current pending transactions

        Given the following requests exist:
            | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
            | 1                | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Flyer       | information | Refugee, Camp | 0          | N/A       | 0       |
            | 1                | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application | information | Visa          | 2          | Visa      | 0       |
            | 1                | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes     | information | Child, Doctor | 1          | N/A       | 0       |

        Given the following claims exist:
            | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 142                    | 0       | Arabic         | example text     | text               | 1          |
            | 142                    | 0       | Urdu           | example text     | text               | 3          |
            | 98                     | 0       | English        | example text     | text               | 1          |
            | 14                     | 0       | English        | example text     | text               | 2          |

    Scenario: visiting user's pending translations
        Given I go to the "Requests" page


    Scenario: successfully deleting a translation
        Given I am on the "requests" page
        When I click button "View" from the list of request
        And I click the "Delete Request" button
        Then I should be on the "/requests" path
        Then I should see confirmation of deleting "Camp Announcment"
        When I refesh the page
        Then I should not see "Camp Announcment"