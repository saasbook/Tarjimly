Feature: view previously submitted request

    As a User
    So that I know I can view a previosuly
    I want to have a details page about

    Background: existing requested translations

        Given the following requests exist:
            | id | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title                  | description | categories    | num_claims | form_type | _status |
            | 1  | 1                | English       | Arabic      | example text  | text            | 2019-11-09 | Camp Announcment       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 2  | 1                | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment Flyer | information | Refugee, Camp | 0          | N/A       | 0       |
            | 3  | 1                | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application       | information | Visa          | 2          | Visa      | 0       |
            | 4  | 1                | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes           | information | Child, Doctor | 2          | N/A       | 2       |

        Given the following claims exist:
            | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 142                    | 0       | Arabic         | example text     | text               | 4          |

    Scenario: visiting request's details page
        Given I go to the "Requests" page
        And I select "Pending Translations"
        When I select "Camp Announcment"
        Then I should see "Details for Camp Announcment"
        Then I should see "Request Language" and "Translation Language"
        Then I should see "Deadline"

    Scenario: return to all requests
        Given I go to the "Requests" page
        And I select "Pending Translations"
        When I select "Camp Announcment"
        When I click the "All Requests" button
        Then I should be on the "/requests" path

    Scenario: if request has been deleted will display 404 not found page
        Given I go to the "Show" page
        Then I should see "The page you were looking for doesn't exist."

