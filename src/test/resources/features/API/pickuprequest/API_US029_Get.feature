Feature:As an administrator (admin) I want to be able to access the entire regular pickup list via API connection.


  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/regular endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/regular" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | id  | request_type | merchant_id | adress        | note             | parcel_quantity | name | phone | cod_amount | invoive | weight | exchange | created_at                  | updated_at                  |
      | 6         | 119 | 1            | 464         | New York City | Herşey çok hızlı | 23              | null | null  | 0.00       | null    | 0      | 0        | 2024-09-26T11:22:45.000000Z | 2024-09-26T12:26:41.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/pickuprequest/regular endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/pickuprequest/regular" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

