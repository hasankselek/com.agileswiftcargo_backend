Feature: As an administrator (admin) I want to be able to create a new ticket record via API connection
 # Bir yönetici (admin) olarak API bağlantısı üzerinden yeni bir ticket kaydı olusturabilmek istiyorum.
  @API_TC5201
  Scenario Outline:admin a POST body with valid authorization information and correct data
  (department_id, service, priority, subject, description, date) is sent to api/ticket/add endpoint,
  it should be verified that the status code returned is 200 and the message information in the response body is "New Ticket Added".
    #api/ticket/add endpoint'ine gecerli authorization bilgileri ve dogru datalar
    # (department_id, service, priority, subject, description, date) iceren bir POST body gönderildiginde
    # dönen status code'in 200 oldugu ve response body'deki message bilgisinin "New Ticket Added" oldugu dogrulanmali.
    * Api user sets "api/ticket/add" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * User send a "POST" request and saves the returned response
    * Verify that the response status code is 200
    * Verify message in the response body is "New Ticket Added"

    Examples:
      | department_id | service  | priority | subject        | description           | date         |
      | 5             | delivery | high     | kargo telimati | kargo teslim edilemedi | 2024-09-29 |
  @API_TC5202
  Scenario: admin  a POST request is sent to the api/ticket/add endpoint without valid authorization information and data,
  it should be verified that the status code returned is 400 and the message in the response body is "There is no data to update.
    #api/ticket/add endpoint'ine gecerli authorization bilgileri ve data icermeyen bir POST request gönderildiginde de
    # dönen status code'in 400 oldugu ve response body'deki message bilgisinin "There is no data to update." oldugu dogrulanmali.
      *  Api user sets "api/ticket/add" path parameters.
      * User send a "POST" request and saves the returned response
      * Verify that the response status code is 400
      * Verify message in the response body is "There is no data to update."

  @API_TC5203
  Scenario Outline: Invalid Token a POST body containing correct data (department_id, service, priority, subject, description, date)
  with invalid authorization information is sent to the api/ticket/add endpoint, it should be verified that the
  status code returned is 401 and the message information in the response body is “Unauthenticated.”.
    #api/ticket/add endpoint'ine gecersiz authorization bilgileri ile dogru datalar (department_id, service, priority, subject, description, date)
    # iceren bir POST body gönderildiginde dönen status code'in 401 oldugu ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.

    * Api user sets "api/ticket/add" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * User send a "POST" request and saves the returned response
    * Verify that the response status code is 401
    * Verify message in the response body is "Unauthenticated."
    Examples:
      | department_id | service  | priority | subject        | description            | date       |
      | 5             | delivery | high     | kargo telimati | kargo teslim edilemedi | 2024-09-29 |

  @API_TC5204
  Scenario Outline: admin The new ticket record to be created through the API must be verified from the API.
  (It can be verified that the record was created by sending a GET request to the api/ticket/{id}
  endpoint with the "New Ticket ID" returned in the response body.
    #API uzerinden olusturulmak istenen yeni ticket kaydinin olustugu API uzerinden dogrulanmali.
    # (Response bodyde dönen "New Ticket ID" ile api/ticket/{id} endpoint'ine GET request gönderilerek kayıt oluşturulduğu doğrulanabilir.)
    * Api user sets "api/ticket/add" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * User send a "POST" request and saves the returned response
    * Verify that the response status code is 200
    * Verify message in the response body is "New Ticket Added"

    Examples:
      | department_id | service  | priority | subject        | description            | date       |
      | 7             | delivery | medium   | kargo telimati | kargo teslim edilemedi | 2024-09-29 |