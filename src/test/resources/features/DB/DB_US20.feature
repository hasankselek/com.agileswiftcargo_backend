Feature:[US_20]merchants table_DELETE

  Background: Common Steps

    * Database connection established


  Scenario:Delete the address cell with a numeric expression in the address information in the merchants table
  via the database and verify that it has been

    Given Prepare query for DELETE the address cell with a numeric expression in the address information
    When Verify that one row affected
    And Database closed