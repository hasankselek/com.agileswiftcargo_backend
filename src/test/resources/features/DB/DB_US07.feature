
  Feature: Verify currency data in the database
    Background: Database connectivity established
      * Database connection established
    @07
  Scenario: Verify the currency data with code 'A' for the name 'Dollars'
      * Query prepared for currency data where name='Dollars'
      * Sort the retrieved data in reverse order by code
      * Verify that the code 'A' exists in the retrieved data
      * Database closed