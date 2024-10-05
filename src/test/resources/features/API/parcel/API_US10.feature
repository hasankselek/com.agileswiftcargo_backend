Feature: As an administrator (admin), I want to be able to delete parcel information with the specified id number via API connection.

  @ug
  Scenario: admin Parcel Send a DELETE request to the api/parcel/delete/{id} endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted', and the 'Deleted ID' in the response body matches
  the id in the path. Then, confirm the deletion by sending a GET request to api/parcel/{id} to verify the parcel has been removed.

    * The api user sets "api/parcel/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no parcel with this id" by sending a GET request to the "api" "parcel" endpoint with the "data" "Deleted ID" returned in the response body.

  Scenario: admin It should be verified that when a DELETE request is sent to the api/parcel/delete/{id}
  endpoint with valid authorization information and (id), the status code returned is 203 and the message
  in the response body is "No id.".

    * The api user sets "api/parcel/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario: admin when a DELETE request is sent with an unregistered (id), the status code returned is
  203 and the message in the response body is "there is no parcel with this id".

    * The api user sets "api/parcel/delete/82396" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".


  Scenario: Invalid Token When a DELETE request is sent to the api/parcel/delete/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message
  information in the response body is "Unauthenticated.".

    * The api user sets "api/parcel/delete/69" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


  Scenario Outline: admin The deletion of the parcel record that is requested to be deleted from the API must be verified from the API.
  (It can be verified that the record has been deleted by sending a GET request to the api/parcel/{id} endpoint
  with the “Deleted ID” returned in the response body).

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".

    Examples:
      | id  |
      | 1110 |