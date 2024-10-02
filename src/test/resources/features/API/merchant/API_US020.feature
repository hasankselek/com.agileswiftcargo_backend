Feature: As an administrator (admin), I want to be able to update merchant information with the specified id number via API connection.
  @US020
  Scenario Outline: admin send a PATCH body with valid authorization information
  and correct (id) and correct data (business_name, mobile, email) is sent to the api/merchant/edit/{id} endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is "Updated".



    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api merchantedit endpoint. ALI
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint. ALI
    # Api kullanicisi donen response body icindeki id bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular


    Examples:
      | id  |
      | 522 |


  @US020
  Scenario Outline: admin When a PATCH request is sent to the api/merchant/edit/{id} endpoint with valid authorization information with
  the correct (id) and no data, it should be verified that the status code returned is 400 and the message information
  in the response body is "No data to update".

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request NON DATA to send to the api merchantedit endpoint. ALI
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No data to update".
    # Api kullanicisi response bodydeki message bilgisinin "No data to update" oldugunu dogrular

    Examples:
      | id  |
      |522  |

  @US020
  Scenario Outline: admin sending a PATCH body (business_name, mobile, email) that does not contain
  an (id) with valid authorization information to the api/merchant/edit/{id} endpoint, the status code returned
  is 203 and the message in the response body is "No id.", and when sending a PATCH body (business_name, mobile, email) that contains an unregistered (id),
  the status code returned is 203 and the message in the response body is  "there is no merchant with this id".

    * The api user sets "api/merchant/edit" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api merchantedit endpoint. ALI
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No data to update" oldugunu dogrular

    Examples:
      | id  |
      |     |

  @US020
  Scenario Outline: admin sending a PATCH body (business_name, mobile, email) that does not contain
  an (id) with valid authorization information to the api/merchant/edit/{id} endpoint, the status code returned
  is 203 and the message in the response body is "No id.", and when sending a PATCH body (business_name, mobile, email) that contains an unregistered (id),
  the status code returned is 203 and the message in the response body is  "there is no merchant with this id".

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api merchantedit endpoint. ALI
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".
    # Api kullanicisi response bodydeki message bilgisinin "No data to update" oldugunu dogrular

    Examples:
      | id  |
      | 5223   |

  @US020
  Scenario Outline: Invalid Token sending  a PATCH body (business_name, mobile, email)
  is sent to the api/merchant/edit/{id} endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api merchantedit endpoint. ALI
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "No data to update" oldugunu dogrular

    Examples:
      | id  |
      | 522 |

  @US020
  Scenario Outline: admin Verify that the id in the response body returned from the api/merchant/edit/{id}
  endpoint is the same as the id path parameter in the api/merchant/edit/{id} endpoint.

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a patch request to send to the api merchantedit endpoint. ALI
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response ALI
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint. ALI


    Examples:
      | id  |
      | 522 |


  @US020
  Scenario Outline: admin send a PATCH body with valid authorization information
  and correct (id) and correct data (business_name, mobile, email) is sent to the api/merchant/edit/{id} endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is "Updated".


    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies request to send and saves the returned response.
    # Api kullanicisi status codeun 203 oldugunu dogrular


    Examples:
      | id  |
      | 522 |










