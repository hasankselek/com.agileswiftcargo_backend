Feature: Make 10000 payments to users whose amount value is zero in the salary payments in
         '2023-09 in the salary_generates table in the database and verify that the payment has been made.

  Background: Common Steps

    * Database connection established

  @US25
  Scenario: DB_TC2501 Make 10000 payments to users whose amount value is zero in the salary payments in
           '2023-09 in the salary_generates table in the database and verify that the payment has been made.

    * Query prepared salary_generates table
    * Verify that 1 row updated to the table
    * Verify amount is update
    * Database closed