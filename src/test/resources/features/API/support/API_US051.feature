Feature: admin I want to be able to update the status of the ticket with the specified id number via the API connection.
  #Bir yönetici (admin) olarak API baglantisi üzerinden belirtilen id numarasına sahip ticket'ın status bilgisini güncelleyebilmek istiyorum.
  @API_TC5101
  Scenario Outline: admin sending a GET body with valid authorization information and correct data (status) to
  the api/ticket/status-update/{id} endpoint, it should be verified that the status code returned is 200
  and the message information in the response body is "Status Updated".
    #api/ticket/status-update/{id} endpoint'ine gecerli authorization bilgileri ve dogru data (status) iceren
    # bir GET body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Status Updated" oldugu dogrulanmali.

    * Api user sets "api/ticket/status-update/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 200
    * Verify message in the response body is "Status Updated"
    Examples:
      | id  |
      | 585 |


  @API_TC5102
  Scenario Outline: admin It should be verified that when a GET body (status) is sent to the api/ticket/status-update/{id}
  endpoint that does not contain an (id) with valid authorization information, the status code returned is 203 and
  the message in the response body is "No id or there is no ticket with this id", and when a GET body (status) is sent
  that contains an unregistered (id), the status code returned is 203 and the message in the response body is"No id or there is no ticket with this id".
         #api/ticket/status-update/{id} endpoint'ine gecerli authorization bilgileri ile (id) icermeyen bir GET body (status) gönderildiginde
         # dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No id or there is no ticket with this id" oldugu,
         # kaydı olmayan bir (id) iceren bir GET body (status) gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message
         # bilgisinin "No id or there is no ticket with this id" oldugu dogrulanmali.
    * Api user sets "api/ticket/status-update/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 203
    * Verify message in the response body is "No id or there is no ticket with this id"
    Examples:
      | id |
      | 58 |

  @API_TC5103
  Scenario: Invalid Token When a GET body (status) is sent to the api/ticket/status-update/{id} endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated."
    #api/ticket/status-update/{id} endpoint'ine gecersiz authorization bilgileri ile bir GET body (status) gönderildiginde dönen status code'in
    # 401 oldugu ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.

    * Api user sets "api/ticket/status-update/<id>" path parameters.
    * Send "GET" request with invalid token
    * Verify that the response status code is 401
    * Verify message in the response body is "Unauthenticated."

  @API_TC5104
  Scenario Outline: admin Verify that the ID in the response body returned from the api/ticket/status-update/{id} endpoint is the same as the id path parameter
  in the api/ticket/status-update/{id} endpoint.
    #api/ticket/status-update/{id} endpoint'inden donen response body icindeki ID bilgisinin api/ticket/status-update/{id}
    # endpoint'inde yazan id path parametresi ile ayni oldugu dogrulanmali.
    * Api user sets "api/ticket/status-update/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that ID in the response body and endpoint ID
    Examples:
      | id |
      | 585 |


  @API_TC5105
 Scenario Outline: admin It should be verified that the ticket record whose status information is requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending a GET request to the api/ticket/{id} endpoint with the “ID” returned in the response body).
  #API uzerinden status bilgisi güncellenmek istenen ticket kaydinin güncellendigi, API uzerinden dogrulanmali.
  # (Response body'de dönen "ID" ile api/ticket/{id} endpoint'ine GET request gönderilerek kaydın güncellendiği doğrulanabilir.)

    * Api user sets "api/ticket/status-update/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Update that <status> in the request body and response body
    Examples:
      | id | status |
      |585 | 3     |