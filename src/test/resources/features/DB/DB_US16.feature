Feature:[US_016]merchant_online_payment_received table

  Background: Common Steps
    * Database connection established


  Scenario:Verify the result by deducting 20% from the amount values of the data with  merchant_id:8
  in the merchant_online_payment_received table in the database .

    Given Prepare query for update the deducting 20 percent from the amount of id 8 in the merchant_online_payment_received table
    When Verify that row of this id affected
    And Database closed