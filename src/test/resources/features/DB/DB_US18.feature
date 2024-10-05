@US18
Feature: Verify by grouping the transported parts day by day according to the date in the merchant_statements table through the database.
  ('2024-09-13' ile '2024-09-19')


  Background: Common Steps

    * Database connection established

  Scenario: Verify grouped transactions from 'merchant_statements' between '2024-09-13' and '2024-09-19'

    * Query prepared merchant_statements table
    * Must view transactions in groups day by day
    * Validates grouped results
