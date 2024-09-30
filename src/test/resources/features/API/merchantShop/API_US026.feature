@US_026
Feature: As an administrator (admin), I want to be able to update the information of the hub with the specified id number via the API connection.

  @TC_2601
  Scenario Outline: admin Send a PATCH request to the api/shop/edit/{id} endpoint with valid authorization, correct id, and data
  (merchant_id, name, contact_no, address, status), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/hub/{id} using
  the same id.

    * The api user sets "api/shop/edit/<id>" path parameters.
    # Api kullanicisi "api/shop/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopedit endpoint.
    # Api kullanicisi api shopedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular


    Examples:
      | id  | merchant_id | name  | contact_no  | address  | status |
      | 896 | 8           | Ahmet | 33358975556 | New York | 1      |

  @TC_2602 # No pickup request with this id.  TC de verilen mesajda uyusmazlik var
  Scenario Outline: admin When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization information with
  the correct (id) and no data, it should be verified that the status code returned is 400 and the message information
  in the response body is "There is no data to update".

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".

    Examples:
      | id  |
      | 621 |


  @TC_2603
  Scenario Outline: admin It should be verified that when sending a PATCH body (name, phone, address) that does not contain an (id)
  to the api/hub/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No id."

    * The api user sets "api/shop/edit" path parameters.
    # Api kullanicisi "api/shop/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopedit endpoint.
    # Api kullanicisi api shopedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No shop id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

    Examples:
      | merchant_id | name  | contact_no  | address  | status |
      | 8           | Ahmet | 33358975556 | New York | 1      |

  @TC_2604
  Scenario Outline: admin It should be verified that when sending a PATCH body (merchant_id, name, contact_no,address,status) that does not contain an (id)
  to the api/shop/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No pickup request with this id."

    * The api user sets "api/shop/edit/<id>" path parameters.
    # Api kullanicisi "api/shop/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopedit endpoint.
    # Api kullanicisi api shopedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api User verifies that the "message" information in the response body is "No pickup request with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "No pickup request with this id." oldugunu dogrular

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 8           | MNG  | 1111111111 | New York | 1      |

  @TC_2605
  Scenario Outline: Invalid Token Send a PATCH request to the api/shop/edit/{id} endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/shop/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <merchant_id>, "<name>", "<contact_no>", "<address>" ve <status> information to send to the api shopedit endpoint.
    # Api kullanicisi api shopedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | merchant_id | name | contact_no | address  | status |
      | 455         | MNG  | 1111111111 | New York | 1      |





