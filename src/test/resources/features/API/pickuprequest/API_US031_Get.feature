Feature:As an administrator (admin), I want to be able to access the detailed information of the pickup with the specified id number via the API connection.


  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/{id} endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" and "<updated_at>".


    Examples:
      | id  | request_type | merchant_id | adress | note               | parcel_quantity | name            | phone        | cod_amount | invoive | weight | exchange | created_at                  | updated_at                  |
      | 120 | 2            | 464         | Boston | Hızlı ve Güvenilir | 0               | HasanKucukselek | 123123123123 | 5.00       | PENDING | 5      | 1        | 2024-09-26T12:41:31.000000Z | 2024-09-26T12:41:31.000000Z |


  Scenario: admin Send a GET request to the api/pickuprequest/{id} endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/pickuprequest" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin Send a GET request to the api/pickuprequest/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no hub with this id'

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no pickup with this id.".

    Examples:
      | id     |
      | 123123 |


  Scenario Outline: Invalid Token Send a GET request to the api/pickuprequest/{id} endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/pickuprequest/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 1  |