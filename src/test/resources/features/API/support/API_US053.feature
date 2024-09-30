Feature: As an administrator (admin), I want to be able to update ticket information with the specified id number via API connection
  #Bir yönetici (admin) olarak API baglantisi üzerinden belirtilen id numarasına sahip ticket bilgilerini güncelleyebilmek istiyorum.
  @API_TC5301
  Scenario Outline:admin a PATCH body containing correct (id) and correct data (department_id, service, priority, subject, description, date)
  with valid authorization information is sent to the api/ticket/edit/{id} endpoint, it should be verified that the status code returned is
  200 and the message information in the response body is "Updated".
    #api/ticket/edit/{id} endpoint'ine gecerli authorization bilgileri ile dogru (id) ve dogru datalar (department_id, service, priority, subject, description, date)
    # iceren bir PATCH body gönderildiginde dönen status code'in 200 oldugu ve response body'deki message bilgisinin "Updated" oldugu dogrulanmali.
    * Api user sets "api/ticket/edit/<id>" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * Send PATCH request <id>
    * Verify that the response status code is 200
    * Verify message in the response body is "Updated"

    Examples:
      |id | department_id | service  | priority | subject        | description            | date       |
      |670|3             | delivery | medium   | kargo telimati | kargo teslim edilemedi | 2024-09-30 |

  @API_TC5302
  Scenario Outline: admin when PATCH request is sent to the api/ticket/edit/{id} endpoint with valid authorization information with the correct
  (id) and no data, it should be verified that the status code returned is 400 and the message in the response body is "There is no data to update.".
      #api/ticket/edit/{id} endpoint'ine gecerli authorization bilgileri ile dogru (id) ve data icermeyen bir PATCH request gönderildiginde
      # dönen status code'in 400 oldugu ve response body'deki message bilgisinin "There is no data to update." oldugu dogrulanmali.

    * Api user sets "api/ticket/edit/<id>" path parameters.
    * User prepares a PATCH request that contains no data.
    * Send PATCH request <id>
    * Verify that the response status code is 400
    * Verify message in the response body is "There is no data to update."

    Examples:
      | id  |
      | 670 |

  @API_TC5303
  Scenario Outline: admin When a PATCH body (department_id, service, priority, subject, description, date) that does not contain an (id) is sent to the api/ticket/edit/{id}
  endpoint with valid authorization information, the status code returned is 203 and the message in the response body is "No id.", and when sending a PATCH body
  (department_id, service, priority, subject, description, date) with an (id) with no record, it should be verified that the status code returned is 203 and the
  message in the response body is "No id or there is no ticket with this id".
    #api/ticket/edit/{id} endpoint'ine gecerli authorization bilgileri ile (id) icermeyen bir PATCH body (department_id, service, priority, subject, description, date)
    # gönderildiginde dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No id." oldugu, kaydı olmayan bir (id) iceren bir PATCH body
    # (department_id, service, priority, subject, description, date) gönderildiginde de dönen status code'in 203 oldugu ve response body'deki message bilgisinin
    # "No id or there is no ticket with this id" oldugu dogrulanmali.

    * Api user sets "api/ticket/edit/" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * User send a "PATCH" request and saves the returned response
    * Verify that the response status code is 203
    * Verify message in the response body is "No  id."
    Examples:
      | department_id | service  | priority | subject        | description            | date       |
      | 3             | delivery | medium   | kargo telimati | kargo teslim edilemedi | 2024-09-30 |

  @API_TC5304
  Scenario Outline:Invalid Token When a PATCH body (department_id, service, priority, subject, description, date) with invalid authorization information is sent to the
  api/ticket/edit/{id} endpoint, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    #api/ticket/edit/{id} endpoint'ine gecersiz authorization bilgileri ile bir PATCH body (department_id, service, priority, subject, description, date)
    # gönderildiginde dönen status code'in 401 oldugu ve response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.

    * Api user sets "api/ticket/edit/" path parameters.
    * Add Ticket that <department_id>,"<service>","<priority>","<subject>","<description>","<date>" in the request body
    * Send "PATCH" request with invalid token
    * Verify that the response status code is 401
    * Verify message in the response body is "Unauthenticated."

    Examples:
      | department_id | service  | priority | subject         | description            | date       |
      | 3             | delivery | medium   | kargo teslimati | kargo teslim edilemedi | 2024-09-30 |

  @API_TC5305
    Scenario:admin Verify that the id in the response body returned from the api/ticket/edit/{id} endpoint is the same as the id path parameter
  in the api/ticket/edit/{id} endpoint.
    #api/ticket/edit/{id} endpoint'inden donen response body icindeki id bilgisinin api/ticket/edit/{id} endpoint'inde yazan id path parametresi
    # ile ayni oldugu dogrulanmali.
  @API_TC5306
  Scenario: The ticket record that is requested to be updated through the API must be verified that it has been updated through the API.
  (It can be verified that the record has been updated by sending a GET request to the api/ticket/{id} endpoint with the “id” returned in the response body).
    #API uzerinden güncellenmek istenen ticket kaydinin güncellendigi, API uzerinden dogrulanmali. (Response body'de dönen "id" ile api/ticket/{id} endpoint'ine
    # GET request gönderilerek kaydın güncellendiği doğrulanabilir.)

