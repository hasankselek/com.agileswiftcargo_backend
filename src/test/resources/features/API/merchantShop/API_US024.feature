@API_US024
Feature: As an administrator (admin), I want to be able to access the detailed information of the merchant shop with the specified id number via the API connection.

  @TC_2401 # 200 ok ve boş Array donuyor
  Scenario Outline: admin Send a GET request to the api/merchantshop/list endpoint with valid authorization, verify that the
  response status code is 200 . Additionally, validate the details
  (id, merchant_id, name, contact_no, address, status, default_shop, created_at, updated_at) of the entry with id(x) in
  the response body.

    * The api user sets "api/merchantshop/<id>" path parameters.
    # Api kullanicisi "api/merchantshop/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Status codu'nun 200 oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified index, including <id>, <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki "<id>", "<merchant_id>", "<name>", "<contact_no>", "<address>", <status>, "<default_shop>", "<created_at>" ve "<updated_at>" bilgilerini doğrular.

    Examples:
      | id  | merchant_id | name  | contact_no | address  | status | default_shop | created_at                  | updated_at                  |
      | 835 | 455         | bugra | 1111111111 | New York | 1      | 0            | 2024-09-24T19:22:41.000000Z | 2024-09-24T19:22:41.000000Z |

  @TC_2402 # Failed oluyor 200 boş Array donuyor
  Scenario Outline: admin Send a GET request to the api/merchantshop/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/merchantshop/<id>" path parameters.
    # Api kullanicisi "api/merchantshop/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

    Examples:
      | id   |
      | 8888 |


  @TC_2403
  Scenario Outline: Invalid Token Send a GET request to the api/merchantshop/{id} endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/merchantshop/<id>" path parameters.
    # Api kullanicisi "api/merchantshop/<id>" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 835 |