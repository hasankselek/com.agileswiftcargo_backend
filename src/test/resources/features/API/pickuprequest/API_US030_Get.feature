Feature:As an administrator (admin) I want to be able to access the entire express pickup list via API connection.

  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/express endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/express" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <exchange>, "<created_at>" and "<updated_at>".

    Examples:
      | dataindex | id  | request_type | merchant_id | adress | note               | parcel_quantity | name            | phone        | cod_amount | invoive | weight | exchange | created_at                  | updated_at                  |
      | 3         | 120 | 2            | 464         | Boston | Hızlı ve Güvenilir | 0               | HasanKucukselek | 123123123123 | 5.00       | PENDING | 5      | 1        | 2024-09-26T12:41:31.000000Z | 2024-09-29T10:32:53.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/pickuprequest/express endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/pickuprequest/express" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

