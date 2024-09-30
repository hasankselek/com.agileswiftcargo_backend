Feature:As an administrator (admin), I want to be able to delete ticket information with the specified id number via API connection.
  #Bir yönetici (admin) olarak API baglantisi üzerinden belirtilen id numarasına sahip ticket bilgilerini silebilmek istiyorum.
  @API_TC5301
  Scenario:When a DELETE request with valid authorization information and id is sent to the api/ticket/delete/{id} endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is "Deleted
    #api/ticket/delete/{id} endpoint'ine gecerli authorization bilgileri ve dogru (id) iceren bir DELETE request gönderildiginde dönen status code'in 200 oldugu
    # ve response body'deki message bilgisinin "Deleted" oldugu dogrulanmali.


  @API_TC5302
  Scenario:It should be verified that when a DELETE request is sent to the api/ticket/delete/{id} endpoint that does not contain
  valid authorization information and (id), the status code returned is 203 and the message in the response body is "No id.",
  and when a DELETE request is sent that contains an unregistered (id), the status code returned is 203 and the message in the response body
  is "No id or there is no ticket with this id".
    #api/ticket/delete/{id} endpoint'ine gecerli authorization bilgileri ve (id) icermeyen bir DELETE request gönderildiginde dönen status code'in 203
    # oldugu ve response body'deki message bilgisinin "No id." oldugu, kaydı olmayan bir (id) iceren bir DELETE request gönderildiginde de dönen status
    # code'in 203 oldugu ve response body'deki message bilgisinin "No id or there is no ticket with this id" oldugu dogrulanmali.


  @API_TC5303
  Scenario: When a DELETE request is sent to the api/ticket/delete/{id} endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    #api/ticket/delete/{id} endpoint'ine gecersiz authorization bilgileri ile bir DELETE request gönderildiginde dönen status code'in 401 oldugu
    # ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.



  @API_TC5304
  Scenario: Verify that the Deleted ID in the response body returned from the api/ticket/delete/{id} endpoint is the same as the
  id path parameter in the api/ticket/delete/{id} endpoint.
    #api/ticket/delete/{id} endpoint'inden donen response body icindeki Deleted ID bilgisinin api/ticket/delete/{id} endpoint'inde yazan id
    # path parametresi ile ayni oldugu dogrulanmali.


  @API_TC5305
  Scenario: The deletion of the ticket record that is requested to be deleted from the API must be verified from the API.
  (It can be verified that the record has been deleted by sending a GET request to the api/ticket/{id} endpoint with the
  "Deleted ID" returned in the response body).
    # API uzerinden silinmek istenen ticket kaydinin silindigi, API uzerinden dogrulanmali. (Response body'de dönen "Deleted ID" ile api/ticket/{id}
    # endpoint'ine GET request gönderilerek kaydın silindiği doğrulanabilir.)