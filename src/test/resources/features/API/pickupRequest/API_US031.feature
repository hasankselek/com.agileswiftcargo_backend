Feature:As an administrator (admin), I want to be able to access the detailed information of the pickup with the specified id number via the API connection.

  @GET
  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/{id} endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/<id>" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the data in the response body includes <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" and "<updated_at>".
    # Api kullanicisi response bodydeki data <id>, "<name>", "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" ve "<updated_at>" içeriklerini doğrular.

    Examples:
      | id  | request_type | merchant_id | adress | note               | parcel_quantity | name            | phone        | cod_amount | invoive | weight | exchange | created_at                  | updated_at                  |
      | 120 | 2            | 464         | Boston | Hızlı ve Güvenilir | 0               | HasanKucukselek | 123123123123 | 5.00       | PENDING | 5      | 1        | 2024-09-26T12:41:31.000000Z | 2024-09-26T12:41:31.000000Z |


  Scenario: admin Send a GET request to the api/pickuprequest/{id} endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/pickuprequest" path parameters.
    # Api kullanicisi "api/hub" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

  Scenario Outline: admin Send a GET request to the api/pickuprequest/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no hub with this id'

    * The api user sets "api/pickuprequest/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no pickup with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "there is no hub with this id" oldugunu dogrular

    Examples:
      | id     |
      | 123123 |


  Scenario Outline: Invalid Token Send a GET request to the api/pickuprequest/{id} endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/pickuprequest/<id>" path parameters.
    # Api kullanicisi "api/hub/<id>" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 1  |