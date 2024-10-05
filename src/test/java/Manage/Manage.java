package Manage;

import lombok.Getter;


@Getter
public class Manage {


    //US01
    private String accounts = "SELECT COUNT(*) FROM accounts WHERE gateway =";

    //US02
    private String blogs= "SELECT title FROM blogs ORDER BY views DESC LIMIT 1;";

    //US03

    //US04

    //US05

    //US06

    //US07
    private String currencyDataByNameAndCodeContainsA = "SELECT * FROM currencies WHERE name=? AND code LIKE ? ORDER BY code DESC";

    //US08
    private String delivery_charges = "INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    //US09
    private String updateDeliveryChargeQuery = "UPDATE delivery_man SET delivery_charge = ? WHERE id = ?";

    //US10-US11
    private String delivery_categories = "INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    //US12
    private String faqs = "select id,question from u201212290_agilesqa.faqs order by updated_at asc limit 3;";

    //US13

    //US14
    private String select_hubs= "SELECT address FROM u201212290_agilesqa.hubs WHERE BINARY name LIKE 'S%'";

    //US15
    private String merchant_delivery_charges = "SELECT delivery_charge_id, SUM(sub_city) AS total_sub_city FROM merchant_delivery_charges WHERE merchant_id = 2 GROUP BY delivery_charge_id;";

    //US16
    private String merchant_online_payment_16 = "UPDATE u201212290_agilesqa.merchant_online_payment_receiveds SET amount=amount-(amount*20/100) WHERE merchant_id = ? ;";

    //US17
    private String sozialLinks = "Select id,name,link From  u201212290_agilesqa.social_links Where link Not REGEXP '^(http|https)://.+$';";
    private String socialLinks_17 = "SELECT name,link FROM  u201212290_agilesqa.social_links;";

    //US18
    private String merchant_statements = "SELECT sum(type) AS total_satis FROM merchant_statements WHERE date BETWEEN '2024-09-13' AND '2024-09-19' GROUP BY date";

    //US19
    private String merchant_statements19 = "SELECT  business_name, address FROM merchants WHERE " +
            "UPPER(business_name) IS NOT NULL " +
            "AND business_name != '' " +
            "AND UPPER(business_name) LIKE '%M%' " +
            "AND UPPER(business_name) LIKE '%N%' " +
            "AND UPPER(business_name) != UPPER('<business_name>');";

    //US20
    private String merchants_20 = "DELETE FROM u201212290_agilesqa.merchants WHERE address REGEXP '[1-9]' LIMIT 1;";

    //US21


    //US22
    private String parcel_logs = "UPDATE parcel_logs SET customer_address = '2379 Wilderman Ridge Suite 207 / Alysahaven' WHERE id = 25";

    //US23
    private String parcels = "ALTER TABLE parcels ADD COLUMN ismi_ali_olanlar INT(1) DEFAULT 0";

    //US24
    private String partners ="SELECT name FROM u201212290_agilesqa.partners ORDER BY created_at ASC LIMIT 1";

    //US25
    private String salary_generates="UPDATE salary_generates SET amount=amount + 10000 WHERE month='2023-09' AND amount=0;";

    //US26


    //US27
    private String supports = "UPDATE supports SET priority='highest' WHERE service = 'payment'";

    //US28
    private String uploads_original = "SELECT SUBSTRING_INDEX(original, '.', -1) AS dosya_uzantisi FROM u201212290_agilesqa.uploads WHERE original IS NOT NULL  AND original LIKE '%.%' AND SUBSTRING_INDEX(original, '.', -1) <> '';";

    //US29
    private String parcel_logs_note = "UPDATE parcel_logs SET note = 'Tebrikler' WHERE hub_id = (SELECT hub_id FROM (SELECT hub_id, COUNT(hub_id) AS toplam_hubs FROM u201212290_agilesqa.parcel_logs GROUP BY hub_id ORDER BY toplam_hubs DESC LIMIT 1) AS subquery);";

    //US30
    private String bank_transaction_amount = "SELECT SUM(amount) AS total_amount FROM u201212290_agilesqa.bank_transactions WHERE DATE(updated_at) BETWEEN '2024-09-09' AND  '2024-09-13';";

    //Yardımcı Sorgular
    private String controlQuery_salary="SELECT amount FROM u201212290_agilesqa.salary_generates WHERE month='2023-09' and user_id=28";
  
    private String controlQuery_supports="SELECT priority FROM u201212290_agilesqa.supports WHERE service = 'payment'";

    private String hub_id_note = "SELECT hub_id,note FROM u201212290_agilesqa.parcel_logs;";

    private String delete_delivery_categories = "DELETE FROM u201212290_agilesqa.deliverycategories WHERE id = ?";

    private String selectDeliveryChargeQuery = "SELECT delivery_charge FROM delivery_man WHERE id = ?";

}
