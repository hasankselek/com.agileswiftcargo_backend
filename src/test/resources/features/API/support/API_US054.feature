Feature:As an administrator (admin), I want to be able to delete ticket information with the specified id number via API connection.
  #Bir yönetici (admin) olarak API baglantisi üzerinden belirtilen id numarasına sahip ticket bilgilerini silebilmek istiyorum.
  
  @API_TC5401
  Scenario:admin When a DELETE request with valid authorization information and id is sent to the api/ticket/delete/{id} endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is "Deleted
    #api/ticket/delete/{id} endpoint'ine gecerli authorization bilgileri ve dogru (id) iceren bir DELETE request gönderildiginde dönen status code'in 200 oldugu
    # ve response body'deki message bilgisinin "Deleted" oldugu dogrulanmali.
  * Api user sets "api/ticket/delete/681" path parameters.
  *  User send a "DELETE" request and saves the returned response
    * Verify that the response status code is 200
    * Verify message in the response body is "Deleted"


  @API_TC5402
  Scenario:admin It should be verified that when a DELETE request is sent to the api/ticket/delete/{id} endpoint that does not contain
  valid authorization information and (id), the status code returned is 203 and the message in the response body is "No id.",
  and when a DELETE request is sent that contains an unregistered (id), the status code returned is 203 and the message in the response body
  is "No id or there is no ticket with this id".
    #api/ticket/delete/{id} endpoint'ine gecerli authorization bilgileri ve (id) icermeyen bir DELETE request gönderildiginde dönen status code'in 203
    # oldugu ve response body'deki message bilgisinin "No id." oldugu, kaydı olmayan bir (id) iceren bir DELETE request gönderildiginde de dönen status
    # code'in 203 oldugu ve response body'deki message bilgisinin "No id or there is no ticket with this id" oldugu dogrulanmali.
    * Api user sets "api/ticket/delete/900" path parameters.
    *  User send a "DELETE" request and saves the returned response
    * Verify that the response status code is 203
    * Verify message in the response body is "No id or there is no ticket with this id"


  @API_TC5403
  Scenario:Invalid Token When a DELETE request is sent to the api/ticket/delete/{id} endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    #api/ticket/delete/{id} endpoint'ine gecersiz authorization bilgileri ile bir DELETE request gönderildiginde dönen status code'in 401 oldugu
    # ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.
    * Api user sets "api/ticket/delete/678" path parameters.
    *  User send a "DELETE" request and saves the returned response
    * Verify that the response status code is 401
    * Verify message in the response body is "Unauthenticated."

  @API_TC5404
  Scenario: admin Verify that the Deleted ID in the response body returned from the api/ticket/delete/{id} endpoint is the same as the
  id path parameter in the api/ticket/delete/{id} endpoint.
    #api/ticket/delete/{id} endpoint'inden donen response body icindeki Deleted ID bilgisinin api/ticket/delete/{id} endpoint'inde yazan id
    # path parametresi ile ayni oldugu dogrulanmali.
    * Api user sets "api/ticket/delete/676" path parameters.
    *  User send a "DELETE" request and saves the returned response
    * Verifies that the data Deleted id information in the returned response body is the same as the id path parameter written in the endpoint.

  @API_TC5405
  Scenario: admin The deletion of the ticket record that is requested to be deleted from the API must be verified from the API.
  (It can be verified that the record has been deleted by sending a GET request to the api/ticket/{id} endpoint with the
  "Deleted ID" returned in the response body).
    # API uzerinden silinmek istenen ticket kaydinin silindigi, API uzerinden dogrulanmali. (Response body'de dönen "Deleted ID" ile api/ticket/{id}
    # endpoint'ine GET request gönderilerek kaydın silindiği doğrulanabilir.)
    * Api user sets "api/ticket/676" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify message in the response body is "No id or there is no ticket with this id"

