@US22
Feature:In the parcel_logs table on the database, change the customer_address value of the data with customer_name:?
  (? = any value can be selected) to '2379 Wilderman Ridge Suite 207 / Alysahaven' and verify that the update was successful.

  Background: Common Steps

    * Database connection established


  Scenario: Change address in parcel log table

    * Query prepared parcel_logs table
    * Address change is made
