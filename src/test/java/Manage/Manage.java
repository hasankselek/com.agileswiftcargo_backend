package Manage;

import lombok.Getter;
import org.junit.Assert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static HelperDB.JDBC_Structure_Methods.resultSet;

@Getter
public class Manage {

    public String sozialLinks = "Select id,name,link From  u201212290_agilesqa.social_links Where link Not REGEXP '^(http|https)://.+$';";

    private String delivery_charges="INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories="INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    private String partners ="SELECT name FROM u201212290_agilesqa.partners ORDER BY created_at ASC LIMIT 1";

    private String salary_generates="UPDATE salary_generates SET amount=amount + 10000 WHERE month='2023-09' AND amount=0";

    private String supports = "UPDATE supports SET priority='highest' WHERE service = 'payment'";


    private String merchant_statements = "SELECT sum(type) AS total_satis FROM merchant_statements WHERE date BETWEEN '2024-09-13' AND '2024-09-19' GROUP BY date";

    private String parcel_logs = "UPDATE parcel_logs SET customer_address = '2379 Wilderman Ridge Suite 207 / Alysahaven' WHERE id = 25";

    private String parcels = "ALTER TABLE parcels ADD COLUMN ismi_ali_olanlar INT(1) DEFAULT 0";


    private String merchant_online_payment_16 = "UPDATE u201212290_agilesqa.merchant_online_payment_receiveds SET amount=amount-(amount*20/100) WHERE merchant_id = ? ;";


    private String merchants_20 = "SELECT * FROM u201212290_agilesqa.merchants WHERE address REGEXP '[1-9]' LIMIT 1;";






    // control queries for US25 and US27

    private String controlQuery_salary="SELECT amount FROM u201212290_agilesqa.salary_generates WHERE month='2023-09' and user_id=28";
  
    private String controlQuery_supports="SELECT priority FROM u201212290_agilesqa.supports WHERE service = 'payment'";

    private String hub_id_note = "SELECT hub_id,note FROM u201212290_agilesqa.parcel_logs;";

    private String bank_transaction_amount = "SELECT SUM(amount) AS total_amount FROM u201212290_agilesqa.bank_transactions WHERE DATE(updated_at) BETWEEN '2024-09-09' AND  '2024-09-13';";

    private String parcel_logs_note = "UPDATE parcel_logs SET note = 'Tebrikler' WHERE hub_id = (SELECT hub_id FROM (SELECT hub_id, COUNT(hub_id) AS toplam_hubs FROM u201212290_agilesqa.parcel_logs GROUP BY hub_id ORDER BY toplam_hubs DESC LIMIT 1) AS subquery);";
  
    private String uploads_original = "SELECT SUBSTRING_INDEX(original, '.', -1) AS dosya_uzantisi FROM u201212290_agilesqa.uploads WHERE original IS NOT NULL  AND original LIKE '%.%' AND SUBSTRING_INDEX(original, '.', -1) <> '';";













    private String delivery_charges = "INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories = "INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";














    private String delete_delivery_categories = "DELETE FROM u201212290_agilesqa.deliverycategories WHERE id = ?";


    private String select_hubs= "SELECT address FROM u201212290_agilesqa.hubs WHERE BINARY name LIKE 'S%'";












}
