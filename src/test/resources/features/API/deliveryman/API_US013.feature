Feature: As an administrator (admin), I want to be able to filter among the deliverables (with email and name information) via API connection.


  Scenario Outline: admin Send a POST request to the api/deliveryman/filter endpoint with valid authorization and the correct data
  (email), verify that the response status code is 200 and the message in the response body includes user_id,name,email and mobile.

    * The api user sets "api/deliveryman/filter" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing  "<email>"  information to send to the api deliverymanadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a  request and saves the returned response to.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the data in the response body <id> includes "<user_id>", "<name>", "<email>", "<mobile>"
   # * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the deliveryendpoint.


  Examples:
 |id|user_id |name              | email                                |mobile|
 |0 |991     |cimen.deliveryman|cimen.deliveryman@agileswiftcargo.com |51515951595|


  Scenario: Invalid Token Send a POST request to the api/hub/add endpoint with valid authorization and incomplete data, verify
  that the response status code is 203 and the message in the response body is 'Name, phone and adress required'.

    * The api user sets "api/deliveryman/filter" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing  "<email>"  information to send to the api deliverymanadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a  request and saves the returned response to.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular
