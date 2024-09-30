Feature:As an administrator (admin), I want to be able to update the regular pickup information with the specified id number via API connection.


  Scenario Outline: admin Send a PATCH request to the api/pickuprequest/express/edit/{id} endpoint with valid authorization, correct id, and data
  (note,address,name), verify that the response status code is 200, the message is 'Updated'

    * The api user sets "api/pickuprequest/express/edit/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api "<address>", "<note>" and "<name>" pickup request express endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    Examples:

      | id  | address | note            | name            |
      | 143 | Arizona | Updated request | Express Request |


  Scenario Outline: admin Send a PATCH request to the api/pickuprequest/express/edit/{id} endpoint with valid authorization, correct id, and data
  (name, phone, address), verify that the response status code is 203, the message is 'No pickup request with this id.'

    * The api user sets "api/pickuprequest/express/edit/<id>" path parameters.
    * The api user prepares a "PATCH" request that contains no data Hasan.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "There is no data to update.".

    Examples:
      | id |
      | 12312  |


  Scenario Outline: admin It should be verified that when sending a PATCH body (address, note, name) that does not contain an (id)
  to the api/pickuprequest/express/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No id."

    * The api user sets "api/pickuprequest/express/edit" path parameters.
    * The api user prepares a PATCH request to send to the api "<address>", "<note>" and "<name>" pickup request express endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No request id.".

    Examples:

      | address | note            | name            |
      | Arizona | Updated request | Express Request |


  Scenario Outline: admin when sending a PATCH body (address,note,name) that contains an unregistered (id), the status
  code returned is 203 and the message in the response body is "No pickup request with this id.".

    * The api user sets "api/pickuprequest/express/edit/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api "<address>", "<note>" and "<name>" pickup request express endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".

    Examples:
      | id   | address | note            | name            |
      | 2514 | Arizona | Updated request | Express Request |

 @d
  Scenario Outline: Invalid Token When a PATCH body (name, phone, address) is sent to the api/hub/edit/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message information
  in the response body is “Unauthenticated.”.

    * The api user sets "api/pickuprequest/express/edit/<id>" path parameters.
    * The api user prepares a patch request to send to the api express edit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized Hasan.

    Examples:
      | id  |
      | 141 |

 @a
  Scenario Outline: admin It should be verified that the express record requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending a GET request to the api/pickuprequest/regular/edit/<id> endpoint with the “id”
  returned in the response body).

    * The api user sets "api/pickuprequest/express/edit/<id>" path parameters.
    * The api user prepares a PATCH request to send to the api "<address>", "<note>" and "<name>" pickup request express endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the express endpoint Hasan.

    Examples:
      | id  | address | note            | name            |
      | 143 | Arizona | Updated request | Express Request |

