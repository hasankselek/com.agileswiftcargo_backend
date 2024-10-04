@US23
Feature:A column named 'name_ali_olanlar' should be created in the parcels table through the database and
        it should be verified that those who have 'ali' in the customer_name are shown with 1 and
        those who do not have 1 are shown with 0 in the created column.

  Background: Common Steps

    * Database connection established


  Scenario: Identify those with the name Ali

    * The column ismi_ali_olanlar is created
    * The column is updated
    * The information is verified.