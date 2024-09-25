Feature: As an administrator (admin) I want to be able to access the entire pickup list via API connection.

  @GET
  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/all endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/all" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <id> index, including "<request_type>", <merchant_id>, "<address>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoice>", <weight>, <exchange>, "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<request_type>", "<merchant_id>", "<address>", "<note>", "<parcel_quantity>", "<name>", "<phone>", "<cod_amount>", "<invoice>", "<weight>", "<exchange>", "<created_at>" ve "<updated_at>" bilgilerini doğrular.
    Examples:
      | id  | request_type | merchant_id | address       | note | parcel_quantity | name | phone | cod_amount | invoice | weight | exchange | created_at                  | updated_at                  |
      | 117 | 1            | 464         | New York City |      | 3               | null | null  | 0.00       | null    | 0      | 0        | 2024-09-19T21:02:38.000000Z | 2024-09-19T21:02:38.000000Z |

