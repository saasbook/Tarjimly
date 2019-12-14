Feature: claimed request deleted by user

    As a translator
    So that I know a translation I have claimed has been submitted by someone else
    I want be notified of the change in status

    Background: current pending translations

        Given I am signed in as a translator

        Given the following requests exist:
            | id | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
            | 1  | 364494           | English       | Arabic      | example text  | text            | 2019-11-09 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 1       |
            | 2  | 364494           | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Flyer       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 3  | 364494           | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application | information | Visa          | 2          | Visa      | 0       |
            | 4  | 364494           | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes     | information | Child, Doctor | 1          | N/A       | 0       |

        Given the following claims exist:
            | id | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 1  | 364495                 | 2       | Arabic         | example text     | text               | 1          |
            | 2  | 364495                 | 1       | Urdu           | example text     | text               | 2          |
            | 3  | 364495                 | 0       | English        | example text     | text               | 3          |

    Scenario: visiting translator's claimed translations
        Given I go to the "Claims" page


    Scenario: successfully dismissing deleted translation
        Given I go to the "Claims" page
        Then I should see "Camp Flyer"
        Then I should see "Camp Announcment"
        Then I should see "Visa Application"
        Then I should see "Requests you claimed have been submitted by another translator. You can dismiss them below!"
        Then I should see "Dismiss Deleted Request"
        When I select "Dismiss Deleted Request"
        When I refesh the page
        Then I should not see "Camp Announcment"

    Scenario: dismissed claims are not displayed
        Given I go to the "Claims" page
        When I select "Dismiss Deleted Request"
        When I refesh the page
        Then I should not see "Camp Announcment"
        When I refesh the page
        Then I should not see "Dismiss Deleted Request"
        Then I should not see "You have successfully dismissed your claim for a deleted request!"
        Then I should not see "Requests you claimed no longer require translation. You can dismiss them below!"

