Feature:admin  want to be able to access the detailed information of the ticket with the specified id number via the API connection.
  # Bir yönetici (admin) olarak API baglantisi üzerinden belirtilen id numarasına sahip ticket'ın detaylı bilgilerine erisebilmek istiyorum.
  @API_TC5001
  Scenario Outline: admin Getting ticket information with valid authorization and correct id
    #api/ticket/{id} endpoint'ine gecerli authorization bilgileri ve dogru data (id) iceren bir GET request
    # gönderildiginde dönen status code'un 200 oldugu doğrulanmali.

    * Api user sets "api/ticket/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 200
    Examples:
      | id |
      | 558  |

  @API_TC5002
  Scenario Outline: admin a GET request with valid authorization information and correct data (id) is
  sent to the api/ticket/{id} endpoint, the data in the response body (id, user_id, department_id, service, priority, subject,
  description, date, attached_file, status, created_at, updated_at) should be verified.
    #api/ticket/{id} endpoint'ine gecerli authorization bilgileri ve dogru data (id)
    # iceren bir GET request gönderildiginde dönen response body'deki datalar (id, user_id, department_id, service,
    # priority, subject, description, date, attached_file, status, created_at, updated_at) dogrulanmal

    * Api user sets "api/ticket/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 200
    * User verifies that the data in the response body includes <id>,<user_id>,<department_id>,"<service>","<priority>","<subject>","<description>","<date>",null,<status>,"<created_at>" and "<updated_at>"

    Examples:
      | id  | user_id | department_id | service  | priority | subject                   | description                              | date       | attached_file | status | created_at                  | updated_at                  |
      | 558   | 957      | 7             | pickup | medium     | test deneme1 | <p>ödemeemi kargoyu alırken yapacagim</p>         | 2024-09-10 | null             | 1      | 2024-09-10T13:17:52.000000Z | 2024-09-10T13:17:52.000000Z |



  @API_TC5003
  Scenario: admin It should be verified that when a GET request is sent to the api/ticket/{id}
            endpoint that does not contain valid authorization information and (id), the status code returned is
            203 and the message in the response body is "No id.", and when a GET request is sent that contains an unregistered (id)
            , the status code returned is 203 and the message in the response body is "No id or there is no ticket with this id".
    # api/ticket/{id} endpoint'ine gecerli authorization bilgileri ve (id) icermeyen bir GET request gönderildiginde dönen status code'un
    # 203 oldugu ve response body'deki message bilgisinin "No id." oldugu, kaydı olmayan bir (id) iceren bir GET request gönderildiginde de
    # dönen status code'in 203 oldugu ve response body'deki message bilgisinin "No id or there is no ticket with this id" oldugu dogrulanmali.

    * Api user sets "api/ticket/" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 203

  @API_TC5004
  Scenario Outline:  admin Sending GET request with unregistered ID
   #: Kaydı olmayan ID ile GET request gönderilmesi
    * Api user sets "api/ticket/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 203
    Examples:
      | id |
      | 7  |


  @API_TC5005
  Scenario: Invalid Token a GET request is sent to the api/ticket/{id} endpoint with invalid authorization information, it should be verified that the
            status code returned is 401 and the message information in the response body is "Unauthenticated.".
       #api/ticket/{id} endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde dönen status code'in 401 oldugu ve
       # response body'deki message bilgisinin "Unauthenticated." oldugu dogrulanmali.

    * Api user sets "api/ticket/<id>" path parameters.
    * Send "GET" request with invalid token
    * Verify that the response status code is 401
    * Verify message in the response body is "Unauthenticated."

