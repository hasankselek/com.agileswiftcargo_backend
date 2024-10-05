Feature: Parcel_logs

  Background: Common Steps

    * Database connection established

  @TC2901
  Scenario: Print and verify congratulations to the note column of the parcels connected to the hub with the most parcel records in the parce

    * Query is sent to find the hub with the most parcel records
    * Verify that 24 added to the parcel table
    * Database closed


