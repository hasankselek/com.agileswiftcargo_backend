Feature: As an administrator (admin) I want to be able to access Ticket List via API connection.
  @TC4901
  Scenario: admin a GET request is sent to the api/ticket/list endpoint with valid authorization information,
            it should be verified that the status code returned is 200
    * Api user sets "api/ticket/list" path parameters.
    * User send a "GET" request and saves the returned response
    * Verify that the response status code is 200
  @TC4902
    Scenario: Invalid Token sent a GET request is sent to the api/ticket/list endpoint   ,
               it should be verified that the status code returned is 401
               and the message information in the response body is “Unauthenticated.”.
      * Api user sets "api/ticket/list" path parameters.
      * Send "GET" request with invalid token
      * Verify that the response status code is 401
      * Verify message in the response body is "Unauthenticated."

  @TC4903
  Scenario Outline: admin a GET request is sent to the api/ticket/list endpoint with valid authorization information,
  the information (user_id, department_id, service, priority, subject, description, date, attached_file, status, created_at, updated_at)
  returned in the response body of id(x) should be verified.
    * Api user sets "api/ticket/<id>" path parameters.
    * User send a "GET" request and saves the returned response
    * User verifies that the data in the response body includes <id>,<user_id>,<department_id>,"<service>","<priority>","<subject>","<description>","<date>",null,<status>,"<created_at>" and "<updated_at>"

    Examples:
      | id  | user_id | department_id | service  | priority | subject         | description                              | date       | attached_file | status | created_at                  | updated_at                  |
      | 556 | 998     | 3             | delivery | high     | korgo teslimati | <p>kargo musteriye teslim edilmemis.</p> | 2024-09-09 | null          | 1      | 2024-09-09T17:39:26.000000Z | 2024-09-09T17:39:26.000000Z |
