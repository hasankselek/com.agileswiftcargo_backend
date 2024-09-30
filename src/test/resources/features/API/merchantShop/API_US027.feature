@US_027
Feature: As an administrator (admin), I want to be able to delete hub information with the specified id number via API connection.

  @TC_2701
  Scenario Outline: admin When a DELETE request is sent to the api/shop/delete/{id} endpoint with valid authorization information and the correct (id),
  it should be verified that the status code returned is 200 and the message information in the response body is "Deleted".


    * The api user sets "api/shop/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no shop with this id" by sending a GET request to the "api" "shop" endpoint with the "data" "Deleted ID" returned in the response body.

    Examples:
      | id  |
      | 977 |

  @TC_2702
  Scenario:admin Send a DELETE request to the api/shop/delete/{id} endpoint  that does not
  contain valid authorization information and (id), the status code returned is 203 and the message in the response body is "there is no shop with this id".

    * The api user sets "api/shop/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api User verifies that the "message" information in the response body is "there is no shop with this id".

  @TC_2703
  Scenario: admin Send a DELETE request to the api/merchant/delete/{id} endpoint  that does not
  contain valid authorization information and (id), the status code returned is 401 and the message in the response body is "Unauthenticated.".

    * The api user sets "api/shop/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api User verifies that the "message" information in the response body is "Unauthenticated.".