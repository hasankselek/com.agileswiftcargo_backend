Feature:[US_044] As an administrator (admin), I want to be able to access the last five blogs via an API connection.

  Scenario:admin sends a GET request to "api/blog/last" endpoint with valid authorization information,
  verifies that the status code returned is 200.

    Given The api user sets "api/blog/last" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 200.


  Scenario:Invalid Token admin sends a GET request to "api/blog/last" endpoint with invalid authorization information,
  verifies that the status code returned is 401
  and the message information in the response body is “Unauthenticated”.

    Given The api user sets "api/blog/last" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 401.

    And The api user verifies that the "message" information in the response body is "Unauthenticated.".

  @z
  Scenario Outline:admin sends a GET request to "api/blog/last" endpoint with valid authorization information,
  verifies the information (title, image_id, description, position, status, created_by, views,
  created_at, updated_at) returned in the response body of id(x).

    Given The api user sets "api/blog/last/<id>" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    When The api user verifies that the data in the response body includes <id>, "<title>",<image_id>, "<description>", "<position>", <status>, <created_by> , "<views>" , "<created_at>" , "<updated_at>".

    Examples:
      | id | id | title      | image_id | description                       | position | status | created_by | views | created_at                  | updated_at                  |
      | 39 | 39 | Merhabalar | null     | Postmen'ler diyarina hos geldiniz | 20       | 1      | 930        | 0     | 2024-09-28T13:33:10.000000Z | 2024-09-28T13:50:24.000000Z |
