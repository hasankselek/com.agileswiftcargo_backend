Feature:As an administrator (admin), I want to be able to update the regular pickup information with the specified id number via API connection.


  Scenario Outline: admin HUB Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization, correct id, and data
  (name, phone, address), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/hub/{id} using
  the same id.

    * The api user sets "api/pickuprequest/regular/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api "<note>" and <parcel_quantity> pickup request regular endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular

    Examples:
      | id  | note               | parcel_quantity |
      | 141 | Hizli ve Guvenilir | 7               |


  Scenario Outline: admin Send a PATCH request to the api/hub/edit/{id} endpoint with valid authorization, correct id, and data
  (name, phone, address), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/hub/{id} using
  the same id.

    * The api user sets "api/pickuprequest/regular/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a "PATCH" request that contains no data Hasan.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    Examples:
      | id  |
      | 141 |


  Scenario Outline: admin It should be verified that when sending a PATCH body (name, phone, address) that does not contain an (id)
  to the api/hub/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No id."

    * The api user sets "api/pickuprequest/regular/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api "<note>" and <parcel_quantity> pickup request regular endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No request id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular

    Examples:
      | note               | parcel_quantity |
      | Hizli ve Guvenilir | 7               |


  Scenario Outline: admin when sending a PATCH body (name, phone, address) that contains an unregistered (id), the status
  code returned is 203 and the message in the response body is "There is no Hub with this id".

    * The api user sets "api/pickuprequest/regular/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api "<note>" and <parcel_quantity> pickup request regular endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No pickup request with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "There is no Hub with this id" oldugunu dogrular

    Examples:
      | id   | note               | parcel_quantity |
      | 2514 | Hizli ve Guvenilir | 7               |

  @a
  Scenario Outline: admin It should be verified that the hub record requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending a GET request to the api/hub/{id} endpoint with the “id”
  returned in the response body).

    * The api user sets "api/pickuprequest/regular/edit/<id>" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api "<note>" and <parcel_quantity> pickup request regular endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint Hasan.
    # Api kullanicisi donen response body icindeki "data" "id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
    * The api user verifies that the "merchant_id" is "464" by sending a GET request to the "api" "pickuprequest" "regular" endpoint with the "data" "id" returned in the response body Hasan.
    # Api kullanicisi response bodyde donen "data" "id" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Updated Hub" oldugunu dogrular


    Examples:
      | id  | note               | parcel_quantity |
      | 141 | Hizli ve Guvenilir | 7               |






