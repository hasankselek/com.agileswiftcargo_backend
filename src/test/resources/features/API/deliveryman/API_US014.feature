@US014
Feature: As an administrator (admin), I want to be able to filter among the deliverables (with email and name information) via API connection.


  Scenario Outline: admin Send a POST request to the api/hub/add endpoint with valid authorization and the correct data
  (name, phone, address), verify that the response status code is 200 and the message in the response body is
  'Hub is added'. Then, confirm the creation of the new hub by sending a GET request to the api/hub/{id} endpoint
  using the 'New Hub ID' from the response.

    * The api user sets "api/deliveryman/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<mobile>", "<email>", <password>, "<address>", <hub_id>, <status> information to send to the api deliverymanadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a  request and saves the returned response to.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "New Delivery Man Added".
    # Api kullanicisi response bodydeki message bilgisinin "Hub is added" oldugunu dogrular

    Examples:
    |name                  | mobile          | email                               |password|address  |hub_id|status |
    |Delivery Man 678u2589 | 1258963478012356|deliveryman@deliveryman27092024.comm |1231235 |W         |1     |1     |



  Scenario: Invalid Token Send a POST request to the api/hub/add endpoint with valid authorization and incomplete data, verify
  that the response status code is 203 and the message in the response body is 'Name, phone and adress required'

    * The api user sets "api/deliveryman/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<mobile>", "<email>", <password>, "<address>", <hub_id>, <status> information to send to the api deliverymanadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a  request and saves the returned response to.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      |name                  | mobile          | email                               |password|address  |hub_id|status |
      |Delivery Man 678u2589 | 1258963478012356|deliveryman@deliveryman27092024.comm |1231235 |W         |1     |1     |




  @US010
  Scenario Outline: admin The new hub record to be created from the API must be verified from the API.
  (With the “New Hub ID” returned in the response body, it can be verified that a record was created by sending a GET
  request to the api/hub/{id} endpoint.)

    * The api user sets "api/deliveryman/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      |  id  |
      | 462 |