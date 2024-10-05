Feature: Update the delivery_charge for a specific deliveryman

  Background: Database connectivity established
    * Database connection established
  @09
  Scenario: Update the delivery_charge of deliveryman with id:13 and verify the update
    * Update the delivery_charge for deliveryman with id 13 to 333.33
    * Verify that the delivery_charge for deliveryman with id 13 has been updated to 333.33
    * Database closed