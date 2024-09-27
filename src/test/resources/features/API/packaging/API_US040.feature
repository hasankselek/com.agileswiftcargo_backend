Feature:As an administrator (admin) I want to be able to create a new packaging record via API connection.

  @post1
  Scenario: admin When a POST request is sent to the endpoint with valid authorization information and complate datas
  it should be verified that the status code returned is 200

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing "Big Box" "100.00" 1 "5" information to send to the api endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Packaging Added".


  @post2
  Scenario: admin When a POST request is sent to the endpoint with valid authorization information and incomplate datas
  it should be verified that the status code returned is 203

    * The api user sets "api/packaging/add" path parameters.
    Then The api user prepares a POST request containing "Big Box" 1 "5" information to send to the api endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".


  @post3
  Scenario: admin When a POST request is sent to the endpoint with valid authorization information and without data
  it should be verified that the status code returned is 203


    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request that contains no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".


  @post4
  Scenario: Invalid Token When a POST request is sent to the endpoint with invalid authorization information,
  it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/packaging/add" path parameters.
    * The api user sends a "POST" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

  @post5
  Scenario: admin Test of new packaging record

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing "Big Box BOX" "100.00" 1 "5" information to send to the api endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * verifies package added



