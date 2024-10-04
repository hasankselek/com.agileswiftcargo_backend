Feature: Bank_transactions

  Background: Common Steps

    * Database connection established

  @US30
  Scenario: According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between 2023-09-27 12:02:32 and 2023-10-02 09:48:31.

    * Prepare query for amount calculation between dates
    * Verify that the total amount is "291375.00"
    * Database closed