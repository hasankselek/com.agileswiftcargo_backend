Feature:As an administrator (admin), I want to be able to delete packaging information with the specified id number via API connection.

  @delete1
  Scenario: admin Send a DELETE request to the endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted', and the 'Deleted ID' in the response body matches
  the id in the path.


    * The api user sets "api/packaging/delete/38" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".


  @delete2
  Scenario: admin It should be verified that when a DELETE request is sent to the
  endpoint with valid authorization information and without id , the status code returned is 203 and the message
  in the response body is "No id."

    * The api user sets "api/packaging/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

  @delete3
  Scenario: admin when a DELETE request is sent with an unregistered (id), the status code returned is
  203 and the message in the response body is "there is no packaging with this id".

    * The api user sets "api/packaging/delete/1000" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".


  @delete4
  Scenario: Invalid Token When a DELETE request is sent to the endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message
  information in the response body is "Unauthenticated.".

    * The api user sets "api/packaging/delete/39" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


