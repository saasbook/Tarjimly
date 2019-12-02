Feature: claimed request deleted by user

    As a translator
    So that I know a translation I have claimed has been deleted
    I want be notified of the change in status

    Background: current pending translations

        Given the following requests exist:
            | id | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
            | 1  | 1                | English       | Arabic      | example text  | text            | 2019-11-09 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 0       |
            | 2  | 1                | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Flyer       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 3  | 1                | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application | information | Visa          | 2          | Visa      | 0       |
            | 4  | 1                | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes     | information | Child, Doctor | 1          | N/A       | 0       |

        Given the following claims exist:
            | id | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 1  | 1                      | 3       | Arabic         | example text     | text               | 1          |
            | 2  | 1                      | 1       | Urdu           | example text     | text               | 2          |
            | 3  | 1                      | 0       | English        | example text     | text               | 3          |

    Scenario: visiting translator's claimed translations
        Given I go to the "Claims" page


    Scenario: successfully dismissing deleted translation
        Given I go to the "Claims" page
        Then I should see "Camp Flyer"
        Then I should see "Camp Announcment"
        Then I should see "Visa Application"
        Then I should see "Requests you claimed no longer require translation. You can dismiss them below!"
        Then I should see "Dismiss Deleted Request" and "View Claim"
        When I select "Dismiss Deleted Request"
        Then I should not see "Camp Announcment"

    Scenario: dismissed claims are not displayed
        Given I go to the "Claims" page
        When I select "Dismiss Deleted Request"
        Then I should not see "Camp Announcment"
        Then I should see "You have sucessfully dismissed your claim for a deleted request!"
        When I refesh the page
        Then I should not see "Dismiss Deleted Request"
        Then I should not see "You have sucessfully dismissed your claim for a deleted request!"
        Then I should not see "Requests you claimed no longer require translation. You can dismiss them below!"

