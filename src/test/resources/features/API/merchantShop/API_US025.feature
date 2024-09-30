@US_025
Feature: As an administrator (admin) I want to be able to create a new hub record via API connection.

  @TC_2501
  Scenario Outline: admin Send a POST request to the api/hub/add endpoint with valid authorization and the correct data
  (merchant_id,name,contact_no,address,status), verify that the response status code is 200 and the message in the response body is
  'Shop is added'. Then, confirm the creation of the new hub by sending a GET request to the api/shop/add endpoint
  using the 'New Shop Added' from the response.

    * The api user sets "api/shop/add" path parameters.
    # Api kullanicisi "api/shop/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopadd endpoint.
    # Api kullanicisi api shopadd endpointine gondermek icin "<merchant_id>", "<name>", "<contact_no>", "<address>" ve "<status>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response. bugra
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "New Shop Added".
    # Api kullanicisi response bodydeki message bilgisinin "New Shop Added" oldugunu dogrular

    Examples:
      | merchant_id | name  | contact_no  | address  | status |
      | 8           | Ahmet | 33358975556 | New York | 1      |

  @TC_2502 # there is no merchant with this id. mesajı degil No merchant id. mesajı donuyor
  Scenario Outline: admin Send a POST request to the api/shop/add endpoint with valid authorization and incomplete data, verify
  that the response status code is 203 and the message in the response body is 'there is no merchant with this id.'

    * The api user sets "api/shop/add" path parameters.
    # Api kullanicisi "api/shop/add" path parametrelerini olusturur
    * The api user prepares a POST request containing, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopadd endpoint.
    # Api kullanicisi api shopadd endpointine gondermek icin <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response. bugra
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "there is no merchant with this id." oldugunu dogrular

    Examples:
      | name  | contact_no  | address  | status |
      | Ahmet | 33358975556 | New York | 1      |


  @TC_2503
  Scenario Outline: Invalid Token Send a POST request to the api/shop/add endpoint with invalid authorization and correct data
  (merchant_id,name,contact_no,address,status), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/shop/add" path parameters.
    # Api kullanicisi "api/shop/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopadd endpoint.
    # Api kullanicisi api shopadd endpointine gondermek icin <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | merchant_id | name  | contact_no  | address  | status |
      | 8           | Ahmet | 33358975556 | New York | 1      |


  @TC_2504
  Scenario Outline: admin The new hub record to be created from the API must be verified from the API.
  (With the “New Shop ID” returned in the response body, it can be verified that a record was created by sending a GET
  request to the api/shop/{id} endpoint.)

    * The api user sets "api/shop/<id>" path parameters.
    # Api kullanicisi "api/shop/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id  |
      | 896 |


