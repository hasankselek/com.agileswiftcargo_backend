Feature: As an administrator (admin) I want to be able to access the entire pickup list via API connection.


  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/all endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/all" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | id  | request_type | merchant_id | adress  | note | parcel_quantity | name                          | phone       | cod_amount | invoive | exchange | created_at                  | updated_at                  |
      | 1         | 277 | 2            | 464         | Arizona | null | 0               | Test Express Pickup Request 2 | 14785236987 | null       | null    | 0        | 2024-10-03T12:02:47.000000Z | 2024-10-03T12:02:47.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/pickuprequest/all endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/pickuprequest/all" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


