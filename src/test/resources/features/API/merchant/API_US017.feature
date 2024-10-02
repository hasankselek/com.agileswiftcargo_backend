


Feature: As an administrator (admin) I want to be able to access Merchant List via API connection.
  @US017
  Scenario: admin Send a GET request is sent to the api/merchant/list endpoint with valid authorization information,
  it should be verified that the status code returned is 200.

    * The api user sets "api/merchant/list" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

  @US017
  Scenario: Invalid Token Send a to the api/merchant/list endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/merchant/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized ALI

  @US017
  Scenario Outline: admin Send a GET request is sent to the the api/merchant/list endpoint with valid authorization information,
  the information (user_id, business_name, merchant_unique_id, current_balance, opening_balance, vat) returned in the response body of id(x) should be verified.

    * The api user sets "api/merchant/list" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, <user_id>, "<business_name>", "<merchant_unique_id>", "<current_balance>", "<opening_balance>" and "<vat>". ALI
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<name>", "<phone>", "<address>", "<current_balance>", <status>, "<created_at>" ve "<updated_at>" bilgilerini doğrular.
    Examples:
      | dataindex | id   | user_id       | business_name      | merchant_unique_id                | current_balance | opening_balance | vat        |
      |  1        | 514  | 1061          | Firm AŞ            | 585683                            | 0.00            | 0.00            | 0.00       |
