Feature: View Requests

  Background: current pending transactions

    Given the following requests exist:
      | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
      | 364494           | French        | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 0       |

    Given the following claims exist:
      | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
      | 364495                 | 0       | Arabic         | example text     | text               | 1          |

    Given I am signed in as a translator

  Scenario: Translator views request details
    Given I go to the "Translator Requests" page
    When I select "View Request"
    Then I should see "French" and "Urdu"

