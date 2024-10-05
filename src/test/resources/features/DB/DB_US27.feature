Feature: Verify that the transaction is realized by making the priority values of the supports
         whose service value in the supports table in the database highest.

  Background: Common Steps

    * Database connection established

  @US27
  Scenario:  DB_TC2701 Verify that the transaction is realized by making the priority values of the supports
             whose service value in the supports table in the database highest.

    * Query prepared supports table
    * Verify that 1 row updated to the table
    * Verify priority is update
    * Database closed
