Feature:

  Background: Common Steps

    * Database connection established


  Scenario: admin Verify the address information of the data containing the letters 'm' and 'n'
  in the data in the business_name column in the merchants table via the database.
   #Database üzerinden merchants tablosundaki business_name sütunundaki verilerden içinde 'm' ve 'n'
   # harflerını ıceren dataların address bilgilerini doğrulayınız
    * Query prepared  business_name column in the merchants table
    * verify the address information of the data containing the letters m and n
    * Database closed