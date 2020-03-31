 Feature: View Filtered Requests

  Background: current pending transactions

    Given the following requests exist:
      | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
      | 364494           | French        | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 0       |
      | 364494           | English       | Afar        | example text2 | text2           | 2019-11-10 | Camp Announcment2| information | Refugee, Camp | 1          | N/A       | 0       |

    Given the following claims exist:
      | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
      | 364495                 | 0       | Arabic         | example text     | text               | 1          |

    Given I am signed in as a translator

  Scenario: Translator views request filtered by language
    Given I go to the "Translator Requests" page
    And I should see "French"
    When I select "English" from "from_language"
    And I select "Afar" from "to_language"
    And I click the "Filter" button
    Then I should see "English"
    And I should see "Afar"