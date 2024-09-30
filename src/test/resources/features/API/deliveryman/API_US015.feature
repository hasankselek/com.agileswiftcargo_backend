@US015
Feature: As an administrator (admin), I want to be able to update Delivery man information with the specified id number via API connection.


  Scenario Outline: admin Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization, correct id, and data
  (name, phone, address), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/hub/{id} using
  the same id.

    * The api user sets "api/deliveryman/edit/<id>" path parameters.
    # Api kullanicisi "api/deliveryman/edit{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api deliverymanedit endpoint with name, mobile, email, address, delivery_charge, pickup_charge, return_charge
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    #* The api user verifies that the id information in the returned response body is the same as the id path parameter written in the deliverymanendpoint.
    # Api kullanicisi donen response body icindeki Deleted ID bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular


    Examples:
      | id  |
      | 428 |


  Scenario Outline: Invalid Token When a PATCH body request to the api/hub/{id} endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/deliveryman/edit/<id>" path parameters.
     # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api deliverymanedit endpoint with name, mobile, email, address, delivery_charge, pickup_charge, return_charge
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlarisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


    Examples:
      | id  |
      | 405 |

@US01
  Scenario: admin It should be verified that when sending a PATCH body (name, phone, address) that does not contain an (id)
  to the api/hub/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No id."

    * The api user sets "api/deliveryman/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api deliverymanedit endpoint with name, mobile, email, address, delivery_charge, pickup_charge, return_charge
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular




  Scenario Outline: admin when sending a PATCH body (name, phone, address) that contains an unregistered (id), the status
  code returned is 203 and the message in the response body is "There is no Hub with this id".

    * The api user sets "api/deliveryman/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api deliverymanedit endpoint with name, mobile, email, address, delivery_charge, pickup_charge, return_charge
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".
    # Api kullanicisi response bodydeki message bilgisinin "There is no Hub with this id" oldugunu dogrular

    Examples:
      | id   |
      | 4130 |





  Scenario Outline: admin It should be verified that the hub record requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending a GET request to the api/hub/{id} endpoint with the “id”
  returned in the response body).

    * The api user sets "api/deliveryman/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.


    Examples:
      | id  |
      | 427 |
