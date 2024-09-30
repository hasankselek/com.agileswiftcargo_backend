Feature: As an administrator (admin), I want to be able to delete hub information with the specified id number via API connection.

  @US021
  Scenario Outline: admin Send a DELETE request to the api/merchant/delete/{id} endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted', and the 'Deleted ID' in the response body matches
  the id in the path. Then, confirm the deletion by sending a GET request to api/merchant/{id} to verify the hub has been removed.

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
    * The api user sets "api/merchant/delete" path parameters yeni olusturulan veri idsi ile. ALI
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Deleted".
    # Api kullanicisi response bodydeki message bilgisinin "Deleted" oldugunu dogrular

    Examples:
      | name            | business_name     | mobile              | email                   | password             | address  | hub_id | status     |
      | XXX             | XXX A.S.          | 11111111111         | erchantfirm@gmail.com   | 123123123            | Houston  | 1      | 1          |


  @US021
  Scenario: admin It should be verified that when a DELETE request is sent to the api/merchant/delete/{id}
  endpoint with valid authorization information and (id), the status code returned is 203 and the message
  in the response body is "No id.".

    * The api user sets "api/merchant/delete" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

  @US021
  Scenario: Invalid Token When a DELETE request is sent to the api/hub/delete/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message
  information in the response body is "Unauthenticated.".

    * The api user sets "api/merchant/delete" path parameters.
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular


  @US021
  Scenario Outline: admin Verify that the Deleted id in the response body returned from the api/merchant/delete/{id}
  endpoint is the same as the id path parameter in the api/merchant/delete/{id} endpoint.

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
    * The api user sets "api/merchant/delete" path parameters yeni olusturulan veri idsi ile. ALI
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Deleted".
    # Api kullanicisi response bodydeki message bilgisinin "Deleted" oldugunu dogrular
    * The api user verifies that the id information in the returned response body is the same as the id delete parameter written in the endpoint. ALI

    Examples:
      | name            | business_name     | mobile              | email                   | password             | address  | hub_id | status     |
      | XXX             | XXX A.S.          | 11111111111         | erchantfirm@gmail.com   | 123123123            | Houston  | 1      | 1          |

  @US021
  Scenario Outline: admin Verify that the Deleted id in the response body returned from the api/merchant/delete/{id}
  endpoint is the same as the id path parameter in the api/merchant/delete/{id} endpoint.

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
    * The api user sets "api/merchant/delete" path parameters yeni olusturulan veri idsi ile. ALI
    # Api kullanicisi "api/hub/delete/{id}" path parametrelerini olusturur
    * The api user sends a "DELETE" request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Deleted".
    # Api kullanicisi response bodydeki message bilgisinin "Deleted" oldugunu dogrular
    * The api user verifies that the id information in the returned response body is the same as the id delete parameter written in the endpoint. ALI
    * The api user sets "api/merchant/" path parameters yeni silinen veri idsi ile. ALI
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | name            | business_name     | mobile              | email                   | password             | address  | hub_id | status     |
      | XXX             | XXX A.S.          | 11111111111         | erchantfirm@gmail.com   | 123123123            | Houston  | 1      | 1          |





