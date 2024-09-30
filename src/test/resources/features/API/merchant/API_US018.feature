Feature: As an administrator (admin), I want to be able to access the detailed information of the Merchant with the specified id number via the API connection.
  @US018
  Scenario: admin Send a GET request with valid authorization information and correct data (id) is sent to the api/merchant/{id} endpoint,
  it should be verified that the status code returned is 200.

    * The api user sets "api/merchant/513" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
  @US018
  Scenario Outline: admin Send a GET request with valid authorization information and correct data (id) is sent to the api/merchant/{id} endpoint,
  the data in the response body (id, user_id, business_name, merchant_unique_id, current_balance, opening_balance, vat) should be verified.

    * The api user sets "api/merchant/514" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies the information in the response body for the entry with the specified  including <id>, <user_id>, "<business_name>", "<merchant_unique_id>", "<current_balance>", "<opening_balance>" and "<vat>". ALI
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<name>", "<phone>", "<address>", "<current_balance>", <status>, "<created_at>" ve "<updated_at>" bilgilerini doğrular.
    Examples:
       | id   | user_id       | business_name      | merchant_unique_id                | current_balance | opening_balance | vat        |
       | 514  | 1061          | Firm AŞ            | 585683                            | 0.00            | 0.00            | 0.00       |

  @US018
  Scenario: admin Send a GET request to the api/hub endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/merchant" path parameters.
    # Api kullanicisi "api/hub" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular
  @US018
  Scenario Outline: admin Send a GET request is sent that contains an unregistered (id),
  the status code returned is 203 and the message in the response body is "there is no merchant with this id".
    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no hub with this id" oldugunu dogrular

    Examples:
      | id   |
      | 5214 |
  @US018
  Scenario Outline: Invalid Token Send a GET request to the api/hub/{id} endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/hub/<id>" path parameters.
    # Api kullanicisi "api/hub/<id>" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized ALI
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 513  |