Feature: display all my submitted requests

    As an aidworker
    So that I can easily access my submitted requests
    I want to be routed to my profile page after I log in
    And see a sorted list of all pending jobs in my "Pending Translations" tab
    And see all completed requests in my "Completed Translations" tab

  Background: requests have been created

    Given I am signed in as a user

    Given the following requests exist:
      | user_tarjimly_id      | from_language | to_language | document_text | document_format | deadline   | title                  | description | categories    | num_claims | form_type | _status |
      | 364494                | English       | Arabic      | example text  | text            | 2019-11-09 | Camp Announcment       | information | Refugee, Camp | 1          | N/A       | 1       |
      | 364494                | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment Flyer | information | Refugee, Camp | 0          | N/A       | 0       |
      | 364494                | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application       | information | Visa          | 2          | Visa      | 1       |
      | 364494                | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes           | information | Child, Doctor | 1          | N/A       | 0       |

    Given I am signed in as a user
    And I go to the "Requests" page

  Scenario: see all pending requests
    Then I should see "Camp Announcment Flyer"
    And I should see "Doctor Notes"

# Scenario: see all completed requests
#   When I click the "Completed Translations" button
#   Then I should see "Camp Announcment"
#   And I should see "Visa Application"