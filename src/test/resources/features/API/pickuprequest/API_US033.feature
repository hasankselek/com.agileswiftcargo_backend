Feature: As an administrator (admin) I want to be able to create a new regular pickup record via API connection.


  Scenario Outline: admin Send a POST request to the api/pickuprequest/regular/add endpoint with valid authorization and the correct data
  (name, phone, address), verify that the response status code is 200 and the message in the response body is
  'Hub is added'. Then, confirm the creation of the new hub by sending a GET request to the api/pickuprequest/regular/add/{id} endpoint
  using the 'New Hub ID' from the response.

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<note>" and <parcel_quantity> information to send to the api pickuprequestregular add endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<merchant_id>, "<note>" ve <parcel_quantity>  bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response Hasan.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Pickup Request Added".

    Examples:
      | merchant_id | note               | parcel_quantity |
      | 464         | Hızlı ve Güvenilir | 7               |


  Scenario Outline: admin When a POST body (note, parcel_quantity) with valid authorization information and missing data (merchant_id) is sent to api/pickuprequest/regular/add endpoint,
  the status code returned is 400 and the message in the response body is "No merchant id."

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<note>" and <parcel_quantity> information to send to the api pickuprequestregular add endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<merchant_id>, "<note>" ve <parcel_quantity>  bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response Hasan.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | merchant_id | note               | parcel_quantity |
      | 0           | Hizli ve Guvenilir | 7               |


  Scenario Outline: admin When sending a POST body (merchant_id, note, parcel_quantity) with invalid merchant_id, it should be verified that the status code returned is 400
  and the message in the response body is "there is no merchant with this id.".

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<note>" and <parcel_quantity> information to send to the api pickuprequestregular add endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<merchant_id>, "<note>" ve <parcel_quantity>  bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response Hasan.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | note               | parcel_quantity |
      | 123123123   | Hizli ve Guvenilir | 7               |


  Scenario Outline: Invalid Token Send a POST request to the api/pickuprequest/regular/add endpoint with invalid authorization and correct data
  (merchant_id,address,name,phone,note,parcel_quantity), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<note>" and <parcel_quantity> information to send to the api pickuprequestregular add endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<merchant_id>, "<note>" ve <parcel_quantity>  bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response Hasan.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | merchant_id | note               | parcel_quantity |
      | 464         | Hizli ve Guvenilir | 7               |


  Scenario Outline: admin The new regular pickup record to be created from the API must be verified from the API.
  (It can be verified that the record was created by sending a GET request to the api/pickuprequest/{id} endpoint with the "New Pickup Request  ID" returned in the response body).

    * The api user sets "api/pickuprequest/regular/add/<id>" path parameters.
     # Api kullanicisi "api/pickuprequest/regular/add/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id  |
      | 417 |




