Feature:As an administrator (admin), I want to be able to access the detailed information of the packaging with the specified id number via the API connection.

  Scenario: admin When a GET request is sent to the endpoint with valid authorization information and existing id number
  it should be verified that the status code returned is 200 , and response body include correct datas.

    * The api user sets "api/packaging/2" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * verifies response body where 2 "Bubble Poly" "20.00" 1 "2" "2023-08-01T14:12:21.000000Z" "2023-08-01T14:12:21.000000Z"


  Scenario: admin When a GET request is sent to the endpoint with valid authorization information and not existing id number

    * The api user sets "api/packaging/100" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".

  Scenario: admin When a GET request is sent to the endpoint with valid authorization information and without id number

    * The api user sets "api/packaging/" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

  Scenario: Invalid Token When a GET request is sent to the endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/packaging/2" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.













