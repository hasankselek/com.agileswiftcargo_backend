Feature: Verify the name of our oldest partner in the partners table in the database.

  Background: Common Steps

    * Database connection established

  @US24
  Scenario: DB_TC2401 Verify the name of our oldest partner in the partners table in the database.
    * Query prepared partners table
    * Processes the results of the partners table query
    * Database closed