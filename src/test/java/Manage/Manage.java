package Manage;

import lombok.Getter;

@Getter
public class Manage {

    public String sozialLinks="Select id,name,link From  u201212290_agilesqa.social_links Where link Not REGEXP '^(http|https)://.+$';";

    private String delivery_charges="INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories="INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    private String partners ="SELECT name FROM u201212290_agilesqa.partners ORDER BY created_at ASC LIMIT 1";

    private String salary_generates="UPDATE salary_generates SET amount=amount + 10000 WHERE month='2023-09' AND amount=0";

    private String supports = "UPDATE supports SET priority='highest' WHERE service = 'payment'";

    private String merchant_statements = "SELECT sum(type) AS total_satis FROM merchant_statements WHERE date BETWEEN '2024-09-13' AND '2024-09-19' GROUP BY date";

    private String parcel_logs = "UPDATE parcel_logs SET customer_address = '2379 Wilderman Ridge Suite 207 / Alysahaven' WHERE id = 25";

    private String parcels = "ALTER TABLE parcels ADD COLUMN ismi_ali_olanlar INT(1) DEFAULT 0";





   // control queries for US25 and US27
    private String controlQuery_salary="SELECT amount FROM u201212290_agilesqa.salary_generates WHERE month='2023-09' and user_id=28";
    private String controlQuery_supports="SELECT priority FROM u201212290_agilesqa.supports WHERE service = 'payment'";
























}
