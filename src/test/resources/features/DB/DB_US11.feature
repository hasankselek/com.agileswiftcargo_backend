Feature:

  Background: Common Steps

    * Database connection established

@DB11
  Scenario:Delete the records with status:0 in the deliverycategories table via database and verify that they are deleted.

    * Prepare query with status to insert 1 data entry into the deliverycategories table.
    * Verify bulk 1 data added to the table
    * Delete this id and status to the deliverycategories table
    * Database closed


