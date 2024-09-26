Feature:As an administrator (admin) I want to be able to access the entire express pickup list via API connection.


  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/express endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/express" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <id> index, including "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki <id> indexe sahip olanin , "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" ve "<updated_at>" bilgilerini doğrular.

    Examples:
      | id  | request_type | merchant_id | adress | note               | parcel_quantity | name            | phone        | cod_amount | invoive | weight | exchange | created_at                  | updated_at                  |
      | 120 | 2            | 464         | Boston | Hızlı ve Güvenilir | 0               | HasanKucukselek | 123123123123 | 5.00       | PENDING | 5      | 1        | 2024-09-26T12:41:31.000000Z | 2024-09-26T12:41:31.000000Z |
      | 120 | 2            | 464         | Boston | Hızlı ve Güvenilir | 0               | HasanKucukselek | 123123123123 | 5.00       | PENDING | 5      | 1        | 2024-09-26T12:41:31.000000Z | 2024-09-26T12:41:31.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/pickuprequest/express endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/pickuprequest/express" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
