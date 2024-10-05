package Manage;

import lombok.Getter;

@Getter
public class Manage {

    public String sozialLinks="Select id,name,link From  u201212290_agilesqa.social_links Where link Not REGEXP '^(http|https)://.+$';";

    private String delivery_charges="INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories="INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    // Eklenen yeni sorgular
    public String currencyDataByNameAndCodeContainsA = "SELECT * FROM currencies WHERE name=? AND code LIKE ? ORDER BY code DESC";

    // Delivery charge güncelleme sorgusu
    public String updateDeliveryChargeQuery = "UPDATE delivery_man SET delivery_charge = ? WHERE id = ?";

    // Delivery charge doğrulama sorgusu
    public String selectDeliveryChargeQuery = "SELECT delivery_charge FROM delivery_man WHERE id = ?";























}
