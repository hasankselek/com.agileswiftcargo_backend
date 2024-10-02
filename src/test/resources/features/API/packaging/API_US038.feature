Feature:As an administrator (admin) I want to be able to access the Packaging List via API connection.

  @get1
  Scenario: admin When a GET request is sent to the api/packaging/list endpoint with valid authorization information,
  it should be verified that the status code returned is 200 , and response body include correct datas.

    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * verifies response body where 2 "Bubble Poly" "20.00" 1 "2" "2023-08-01T14:12:21.000000Z" "2023-08-01T14:12:21.000000Z"



  @get2
  Scenario: Invalid Token When a GET request is sent to the api/packaging/list endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.






