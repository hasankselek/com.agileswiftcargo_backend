Feature:

  Background: Common Steps

    * Database connection established


  Scenario: admin Collect the “sub_city” values of those with “merchant_id” value 2 and different “delivery_charge_id” values
  from the merchant_delivery_charges table from the database and list and verify the results for each “delivery_charge_id”.
   #Database üzerinden merchant_delivery_charges tablosundan "merchant_id" değeri 2 olan ve farklı "delivery_charge_id"
   # değerlerine sahip olanların "sub_city" değerlerini toplayıp her bir "delivery_charge_id" için sonuçları listeleyip doğrulayınız
    * Query prepared merchant_delivery_charges links table
    * verify the results for each delivery_charge_id
    * Database closed