

Feature[US_048]:As an administrator (admin), I want to be able to delete blog information with the specified id number via API connection.


  Scenario Outline[TC_4801]:admin Send a DELETE request to the api/blog/delete/{id} endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted'.

    * The api user sets "api/blog/delete/<id>" path parameters.

    * The api user sends a "DELETE" request and saves the returned response.

    * The api user verifies that the status code is 200.

    * The api user verifies that the "message" information in the response body is "Deleted".

 Examples:
    | id |
    | 21 |

  Scenario Outline: [TC_4802]: admin It should be verified that when a DELETE request is sent to the api/blog/delete/{id}
  endpoint with valid authorization information and (id), the status code returned is 203 and the message
  in the response body is "No id.".

    * The api user sets "api/blog/delete/<id>" path parameters.

    * The api user sends a "DELETE" request and saves the returned response.

    * The api user verifies that the status code is 203.

    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | id |
      | 21 |

  Scenario Outline[TC_4803]: admin when a DELETE request is sent to the api/blog/delete/{id} with an unregistered (id),
  the status code returned is 203 and the message in the response body is "there is no blog with this id".

    * The api user sets "api/blog/delete/<id>" path parameters.

    * The api user sends a "DELETE" request and saves the returned response.

    * The api user verifies that the status code is 203.

    * The api user verifies that the "message" information in the response body is "there is no blog with this id".

    Examples:
      | id |
      | 21 |

  Scenario Outline[TC_4804]: Invalid Token When a DELETE request is sent to the api/blog/delete/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message
  information in the response body is "Unauthenticated.".

    * The api user sets "api/blog/delete/<id>" path parameters.

    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    Examples:
      | id |
      | 21 |

  Scenario Outline[TC_4805]: admin verified that the 'Deleted ID' in the response body from send request to the api/blog/delete/{id}
  matches the id in the path and confirm the deletion by sending a GET request to api/blog/{id} to verify the blog has been removed.
  Verify that the Deleted ID in the response body

    * The api user sets "api/blog/delete/<id>" path parameters.

    * The api user sends a "DELETE" request and saves the returned response.

    * The api user verifies that the data Deleted id information in the returned response body is the same as the id path parameter written in the endpoint.
    Examples:
      | id |
      | 21 |