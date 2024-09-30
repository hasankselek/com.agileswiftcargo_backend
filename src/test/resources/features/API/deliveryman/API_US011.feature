Feature: As an administrator (admin) I want to be able to access the Delivery Man list via API connection.



  Scenario Outline: admin When a GET request is sent to the api/deliveryman/list endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/deliveryman/list" path parameters.
    # Api kullanicisi "api/deliveryman/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
  *  The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including <user_id>,<status>,"<delivery_charge>","<pickup_charge>","<return_charge>","<current_balance>","<opening_balance>","<driving_license_image_id>","<created_at>" and "<updated_at>"
    # Api kullanicisi response bodydeki data <id> user_id, status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id, created_at, updated_at) " içeriklerini doğrular.
  Examples:


   |dataIndex |user_id|  status|delivery_charge| pickup_charge|return_charge|current_balance|opening_balance|driving_license_image_id|created_at                    |updated_at                    |
   |0         |   1046|   1 |     0.00      | 0.00         | 0.00        |0.00           |0.00           |null                    |2024-09-26T18:14:08.000000Z|2024-09-26T18:14:08.000000Z      |



  Scenario: Invalid Token Send a GET request to the api/hub/list endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/deliveryman/list" path parameters.
    # Api kullanicisi "api/deliveryman/list" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular