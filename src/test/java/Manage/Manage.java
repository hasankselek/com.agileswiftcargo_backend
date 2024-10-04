package Manage;

import lombok.Getter;

@Getter
public class Manage {

    public String sozialLinks="Select id,name,link From  u201212290_agilesqa.social_links Where link Not REGEXP '^(http|https)://.+$';";

    private String delivery_charges="INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories="INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    private String uploads_original = "SELECT SUBSTRING_INDEX(original, '.', -1) AS dosya_uzantisi FROM u201212290_agilesqa.uploads WHERE original IS NOT NULL  AND original LIKE '%.%' AND SUBSTRING_INDEX(original, '.', -1) <> '';";

    private String hub_id_note = "SELECT hub_id,note FROM u201212290_agilesqa.parcel_logs;";

    private String bank_transaction_amount = "SELECT SUM(amount) AS total_amount FROM u201212290_agilesqa.bank_transactions WHERE DATE(updated_at) BETWEEN '2024-09-09' AND  '2024-09-13';";

    private String parcel_logs_note = "UPDATE parcel_logs SET note = 'Tebrikler' WHERE hub_id = (SELECT hub_id FROM (SELECT hub_id, COUNT(hub_id) AS toplam_hubs FROM u201212290_agilesqa.parcel_logsGROUP BY hub_id ORDER BY toplam_hubs DESC LIMIT 1) AS subquery);";



















}
