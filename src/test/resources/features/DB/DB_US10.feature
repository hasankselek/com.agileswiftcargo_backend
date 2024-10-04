Feature:

  Background: Common Steps

    * Database connection established

@DB10
  Scenario: Enter the necessary data in the deliverycategories table.
    * Prepare query to insert 2 data entry into the deliverycategories table.
    * Verify bulk 2 data added to the table.
    * Database closed.