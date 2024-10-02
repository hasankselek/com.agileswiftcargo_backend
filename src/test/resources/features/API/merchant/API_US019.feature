
Feature: As an administrator (admin) I want to be able to create a new hub record via API connection.
  @US019
  Scenario Outline: admin Send a POST request to the api/hub/add endpoint with valid authorization and the correct data
  (name, phone, address), verify that the response status code is 200 and the message in the response body is
  'Hub is added'. Then, confirm the creation of the new hub by sending a GET request to the api/hub/{id} endpoint
  using the 'New Hub ID' from the response.

    * The api user sets "api/merchant/add" path parameters.
    # Api kullanicisi "api/merchant/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<business_name>", "<mobile>", "<email>", "<password>", "<address>", "<hub_id>" and "<status>" information to send to the api hubadd endpoint. ALI
    # Api kullanicisi api merchantadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response ALI
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "New Merchant Added".
    # Api kullanicisi response bodydeki message bilgisinin "Hub is added" oldugunu dogrular

    Examples:
      | name            | business_name     | mobile              | email                   | password             | address  | hub_id | status     |
      | Ali USTA        | USTA A.S.         | 11111111111         | erchantfirm@gmail.com   | 123123123            | Houston  | 1      | 1          |

  @US019
  Scenario Outline: Invalid Token Send a POST body with invalid authorization information
  and correct data (name, business_name, mobile, email, password, address, hub_id, status) to the api/merchant/add endpoint,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/merchant/add" path parameters.
    # Api kullanicisi "api/merchant/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<business_name>", "<mobile>", "<email>", "<password>", "<address>", "<hub_id>" and "<status>" information to send to the api hubadd endpoint. ALI
    # Api kullanicisi api merchantadd endpointine gondermek icin "<name>", ...." bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response ALI
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Hub is added" oldugunu dogrular

    Examples:
      | name            | business_name     | mobile              | email                   | password             | address  | hub_id | status     |
      | Ali USTA        | USTA A.S.         | 11111111111         | erchantfirm@gmail.com   | 123123123            | Houston  | 1      | 1          |

  @US019
  Scenario: admin The new hub record to be created from the API must be verified from the API.
  (With the “New Hub ID” returned in the response body, it can be verified that a record was created by sending a GET
  request to the api/list/{id} endpoint.)

    * The api user sets "api/merchant/add" path parameters.
    # Api kullanicisi "api/merchant/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<business_name>", "<mobile>", "<email>", "<password>", "<address>", "<hub_id>" and "<status>" information to send to the api hubadd endpoint. ALI
    # Api kullanicisi api merchantadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response ALI
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user sets "api/merchant/" path parameters yeni olusturulan veri idsi ile. ALI
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
























