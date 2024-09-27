Feature:

  @patch1
  Scenario: admin Send a PATCH request to the endpoint with valid authorization, verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/packaging/{id} using the same id.


    * The api user sets "api/packaging/edit/12" path parameters.
    * The api user prepares a patch request to send to the api hubedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.


  @patch2
  Scenario:admin When a PATCH request is sent to the endpoint with valid authorization information with
  the correct (id) and no data, it should be verified that the status code returned is 400 and the message information
  in the response body is "There is no data to update.".

    * The api user sets "api/packaging/edit/12" path parameters.
    * The api user prepares a "PATCH" request that contains no data.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "There is no data to update.".



  @patch3
  Scenario: admin It should be verified that when sending a PATCH body  that does not contain an (id)
  to the endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No id."

    * The api user sets "api/packaging/edit" path parameters.
    * The api user prepares a patch request to send to the api hubedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


