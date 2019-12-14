 Feature: Claim Request

  Background: current pending transactions

    Given the following requests exist:
      | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
      | 364494           | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment | information | Refugee, Camp | 1          | N/A       | 0       |

    Given the following claims exist:
      | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
      | 364495                 | 0       | Arabic         | example text     | text               | 1          |

    Given I am signed in as a translator

  Scenario: Translator starts a new claim
    Given I go to the "Translator Requests" page
    When I click button "Claim" from the list of request
    Then I should be able to find the claim by my id
#   Background:  translations

#     Given I am signed in as a translator


#   Scenario: Translator starts a new claim
#     Given I am on the "translators/requests" page
#     When I click on "Claim" from the list of request
#     Then I should be able to find the claim by my id
