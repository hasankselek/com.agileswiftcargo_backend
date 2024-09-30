
Feature:[US_043] As an administrator (admin), I want to be able to access the entire blog list via API connection.


  Scenario:admin sends a GET request to api/blog/list endpoint with valid authorization information,
           verifies that the status code returned is 200.
    Given The api user sets "api/blog/list" path parameters.

    When The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 200.


  Scenario:Invalid Token Admin sends a GET request to api/blog/list endpoint with invalid authorization information,
           verifies that the status code returned is 401 and the message information in the response body is “Unauthenticated”.

    Given The api user sets "api/blog/list" path parameters.

    When The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 401.

    And The api user verifies that the "message" information in the response body is "Unauthenticated.".



  Scenario Outline:admin sends a GET request to api/blog/list endpoint with valid authorization information,
  verifies the information (title, image_id, description, position, status, created_by, views, created_at
  ,updated_at) returned in the response body of id(x).

    Given The api user sets "api/blog/list/<id>" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    When The api user verifies that the data in the response body includes <id>, "<title>",<image_id>, "<description>", "<position>", <status>, <created_by> , "<views>" , "<created_at>" , "<updated_at>".

    Examples:
    | id  | id| title      | image_id | description                      |  position  |  status |created_by|views|created_at                  |updated_at                 |
    | 39  | 39| Merhabalar |    null   |Postmen'ler diyarina hos geldiniz |      20   |     1   |  930     | 0    | 2024-09-28T13:33:10.000000Z |2024-09-28T13:50:24.000000Z|
