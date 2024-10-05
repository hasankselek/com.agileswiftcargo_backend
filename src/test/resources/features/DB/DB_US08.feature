Feature: Create a new record in the delivery_charges table

  Background: Database connectivity established
    * Database connection established

  @O8
  Scenario: Insert new delivery charge and verify
    * insert the new delivery charge into the database
    * Verify that 1 added to the table
    * Database closed





