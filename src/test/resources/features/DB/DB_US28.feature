Feature: Uploads

  Background: Common Steps

    * Database connection established

  @Hasan
  Scenario: List and verify how many files in different formats are uploaded to the system from the uploads table via the database.

    * Query prepared uploads table and original column
    * Verify how many different formats the files under the Original column are in
    * Database closed