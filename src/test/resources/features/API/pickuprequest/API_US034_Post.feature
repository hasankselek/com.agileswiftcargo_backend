Feature: As an administrator (admin) I want to be able to create a new express pickup record via API connection.

  @test
  Scenario Outline: admin When a POST body with valid authorization information and correct data (merchant_id, adress, name, phone) is sent to the api/pickuprequest/express/add endpoint and valid information
  it should be verified that the status code returned is 200 and the message information in the response body is "Pickup Request Added".

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
    * The api user sends a "POST" request and saves the returned response Hasan.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Pickup Request Added".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 464         | New York City | HasanKucukselek | 123123123 |


  @test
  Scenario Outline: admin When a POST body (adress,name,phone) with valid authorization information and missing data (merchant_id) is sent to api/pickuprequest/express/add endpoint,
  the status code returned is 400 and the message in the response body is "No merchant id."

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
    * The api user sends a "POST" request and saves the returned response Hasan.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 0           | New York City | HasanKucukselek | 123123123 |


  @test
  Scenario Outline: admin When sending a POST body (merchant_id, adress, name, phone) with invalid merchant_id, it should be verified that the status code returned is 400
  and the message in the response body is "there is no merchant with this id.".

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
    * The api user sends a "POST" request and saves the returned response Hasan.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 123123123   | New York City | HasanKucukselek | 123123123 |


  @test
  Scenario Outline: Invalid Token Send a POST request to the api/pickuprequest/express/add endpoint with invalid authorization and correct data
  (merchant_id, adress, name, phone), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/pickuprequest/express/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
    * The api user sends a "POST" request and saves the returned response Hasan.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".


    Examples:
      | merchant_id | address       | name            | phone     |
      | 464         | New York City | HasanKucukselek | 123123123 |

  Scenario Outline: admin The new express pickup record to be created from the API must be verified from the API.
  (It can be verified that the record was created by sending a GET request to the api/pickuprequest/express/add/ endpoint with the "New Pickup Request  ID" returned in the response body).

    * The api user sets "api/pickuprequest/express/add/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.

    Examples:
      | id  |
      | 417 |
