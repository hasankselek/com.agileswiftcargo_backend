@DB
Feature:AgileSwiftCargo All Database User Stories

  Background: Common Steps

    * Database connection established

  @DB_US01
  Scenario: [accounts]  Verify that the number of users with gateway = 2 in the accounts table in the database is ?.

    * Verify that the number of users with gateway = 2 in the accounts table in the database is 2.
    * Database closed

  @DB_US02
  Scenario: [blogs] Verify the most viewed blog name in the blogs table via the database.

    * The most viewed name on the blogs page is found
    * The title should be "Cargo Security and Risk Management Crucial Aspects in Transportation"
    * Database closed

  @DB_US03
  Scenario: [activity_log] Log_name in the activity_log table via the database: User is more than log_name: Upload is more than log_name: Upload data.

    *
    *
    * Database closed

  @DB_US04
  Scenario: [bank_transactions] Verify the creation dates of the 3 most recently updated records in the bank_transactions table on the database by sorting them from old to new.

    *
    *
    * Database closed


  @DB_US05
  Scenario: [bank_transactions] List and verify the amount information of the data created between '2024-09-09' AND '2024-09-13' from the data in the bank_transactions table on the database, sorting from small to large.

    *
    *
    * Database closed


  @DB_US06
  Scenario: [courier_statements] List and verify how many different delivery drivers each parcel was transported uniquely from the parcel_id numbered parcels in the courier_statements table in the database.

    *
    *
    * Database closed


  @DB_US07
  Scenario: [currencies] Verify the data with 'A' in the code information of the contents with name=Dollars in the currencies table on the database by sorting them in reverse order.

    * Query prepared for currency data where name='Dollars'
    * Sort the retrieved data in reverse order by code
    * Verify that the code 'A' exists in the retrieved data
    * Database closed

  @DB_US08
  Scenario: [delivery_charges] Make a data record by entering all data in the delivery_charges table via the database and verify that a new record can be made (status:0)

    * insert the new delivery charge into the database ulvi
    * Verify that 1 added to the table
    * Database closed

  @DB_US09
  Scenario: [delivery_man] Update the delivery_charge information of deliveryman with id:? in the delivery_man table on the database as ? and verify that it has been updated.

    * Update the delivery_charge for deliveryman with id 13 to 333.33
    * Verify that the delivery_charge for deliveryman with id 13 has been updated to 333.33
    * Database closed

  @DB_US10
  Scenario: [deliverycategories] Add multiple data to the deliverycategories table via the database (multiple data in a single query) and verify that the new data record can be added.

    * Prepare query to insert 2 data entry into the deliverycategories table.
    * Verify bulk 2 data added to the table
    * Database closed

  @DB_US11
  Scenario: [deliverycategories] Delete the records with status:0 in the deliverycategories table via database and verify that they are deleted.

    * Prepare query with status to insert 1 data entry into the deliverycategories table.
    * Verify bulk 1 data added to the table
    * Delete this id and status to the deliverycategories table
    * Database closed

  @DB_US12
  Scenario: [faqs] Verify the Questions values of the 3 oldest uptade data in the faqs table via the database.
            # Database üzerinden faqs tablosundaki en eski uptade işlemi yapılan 3 datanın Questions değerlerini doğrulayınız.

    * Query prepared faqs links table
    * Compare Question from the result set of Faqs
    * Database closed

  @DB_US13
  Scenario: [hub_payments] Verify the sum of hub payments with hub_id:328 in the hub_payments table on the database.

    *
    * Database closed

  @DB_US14
  Scenario: [hubs] Verify the address information of the data whose name information starts with 'S' from the hubs table over the database.

    *  Verify the the address information of the data whose name information starts with 'S' from the hubs table.
    *  Verify the "address" information Results are obtained.
    *  Database closed

  @DB_US15
  Scenario: [merchant_delivery_charges] Collect the “sub_city” values of those with “merchant_id” value 2 and different “delivery_charge_id” values
  from the merchant_delivery_charges table from the database and list and verify the results for each “delivery_charge_id”.

   # Database üzerinden merchant_delivery_charges tablosundan "merchant_id" değeri 2 olan ve farklı "delivery_charge_id"
   # değerlerine sahip olanların "sub_city" değerlerini toplayıp her bir "delivery_charge_id" için sonuçları listeleyip doğrulayınız

    * Query prepared merchant_delivery_charges links table
    * verify the results for each delivery_charge_id
    * Database closed

  @DB_US16
  Scenario: [merchant_online_payment_receiveds] Verify the result by deducting 20% from the amount values of the data with  merchant_id:8 in the merchant_online_payment_received table in the database?

    * Prepare query for update the deducting 20 percent from the amount of id 8 in the merchant_online_payment_received table
    * Verify that row of this id affected
    * Database closed

  @DB_US17
  Scenario: [social_links] Verify whether the links in the social_links table are the correct links in the database.

    * Prepare query for identifying the URL addresses in the social_links table that aren't valid link.
    * Verify that URL address of links are valid.
    * Verify that URL address of links until entire row with name column compared.
    * Database closed

  @DB_US18
  Scenario: [merchant_statements] Verify by grouping the transported parts day by day according to the date in the merchant_statements table through the database.

    * Query prepared merchant_statements table
    * Must view transactions in groups day by day
    * Validates grouped results
    * Database closed

  @DB_US19
  Scenario: [merchant_statements] Verify the address information of the data containing the letters 'm' and 'n' in the data in the business_name column in the merchants table via the database.
            #Database üzerinden merchants tablosundaki business_name sütunundaki verilerden içinde 'm' ve 'n'
            # harflerını ıceren dataların address bilgilerini doğrulayınız

    * Query prepared  business_name column in the merchants table
    * verify the address information of the data containing the letters m and n
    * Database closed

  @DB_US20
  Scenario: [news_offers] Verify which day and by whom the oldest offer information was entered into the news_offers table via the database.

    * Prepare query for DELETE the address cell with a numeric expression in the address information
    * Verify that one row affected
    * Database closed

  @DB_US21
  Scenario: [news_offers] Verify which day and by whom the oldest offer information was entered into the news_offers table via the database.

    *
    * Database closed


  @DB_US22
  Scenario: [parcel_logs] In the parcel_logs table on the database, change the customer_address value of the data with customer_name:? (? = any value can be selected) to '2379 Wilderman Ridge Suite 207 / Alysahaven' and verify that the update was successful.

    * Query prepared parcel_logs table
    * Address change is made
    * Database closed

  @DB_US23
  Scenario: [parcels] A column named 'name_ali_olanlar' should be created in the parcels table through the database and it should be verified that those who have 'ali' in the customer_name are shown with 1 and those who do not have 1 are shown with 0 in the created column.

    * The column ismi_ali_olanlar is created
    * The column is updated
    * The information is verified.
    * Database closed

  @DB_US24
  Scenario: [partners] Verify the name of our oldest partner in the partners table in the database.

    * Query prepared partners table
    * Processes the results of the partners table query
    * Database closed

  @DB_US25
  Scenario: [salary_generates] Make 10000 payments to users whose amount value is zero in the salary payments in'2023-09 in the salary_generates table in the database and verify that the payment has been made.

    * Query prepared salary_generates table
    * Verify that 1 row updated to the table
    * Verify amount is update
    * Database closed

  @DB_US26
  Scenario: [subscribes] List and verify the first 3 users with the longest email from the users in the subscribes table from the database.

    *
    * Database closed

  @DB_US27
  Scenario: [supports] Verify that the transaction is realized by making the priority values of the supports whose service value in the supports table in the database highest.

    * Query prepared supports table
    * Verify that 1 row updated to the table
    * Verify priority is update
    * Database closed

  @DB_US28
  Scenario: [uploads] List and verify how many files in different formats are uploaded to the system from the uploads table via the database.

    * Query prepared uploads table and original column
    * Verify how many different formats the files under the Original column are in
    * Database closed

  @DB_US29
  Scenario: [parcel_logs] Print and verify congratulations to the note column of the parcels connected to the hub with the most parcel records in the parce

    * Query is sent to find the hub with the most parcel records
    * Verify that 24 added to the parcel table Hasan
    * Database closed

  @DB_US30
  Scenario: [bank_transactions] According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between 2023-09-27 12:02:32 and 2023-10-02 09:48:31.

    * Prepare query for amount calculation between dates
    * Verify that the total amount is "291375.00"
    * Database closed
















