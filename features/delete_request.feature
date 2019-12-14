Feature: delete a requested translation

    As a User
    So that I know I have succesfully deleted a requested
    I want to no longer see the doccument in my "Pending Translations" tab

    Background: current pending transactions

        Given I am signed in as a user

        Given the following requests exist:
            | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
            | 364494           | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 0       |

        Given the following claims exist:
            | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 364495                 | 0       | Arabic         | example text     | text               | 1          |

        Given I am signed in as a user

    Scenario: visiting user's pending translations
        Given I go to the "Requests" page


    Scenario: successfully deleting a translation
        When I click button "View" from the list of request
        And I click the "Delete Request" button
        Then I should be on the "/requests" path
        Then I should see "Your request 'Camp Announcment' has been deleted!"
        When I refesh the page
        Then I should not see "Camp Flyer"