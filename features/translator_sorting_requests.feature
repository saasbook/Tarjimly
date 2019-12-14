# Feature: View Sorted Requests
#
# Feature: Alert Of Requests With No Claim
#
#   Background: current pending transactions
#
#     Given the following requests exist:
#       | user_tarjimly_id | id         |  from_language | to_language | document_text | document_format | deadline   | title            | description | categories    | num_claims | form_type | _status |
#       | 364494           | 1          |  English       | Arabic      | example text  | text            | 2020-12-12 | Camp Announcment | information | Refugee, Camp | 0          | N/A       | 0       |
#       | 364494           | 2          |  English       | Arabic      | example text2 | text2           | 2020-12-12 | Camp Announcment2| information | Refugee, Camp | 1          | N/A       | 0       |
#
#     Given the following claims exist:
#       | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
#       | 364495                 | 0       | Arabic         | example text     | text               | 4          |
#
#     Given I am signed in as a translator
#
#
#   Scenario: Translator views request sorted by deadline
#     Given I am on the "translators/requests" page
#     When I sort by deadline
#     Then I should see a list of requests sorted
