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

    private String delivery_charges = "INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) Values (?,?,?,?,?,?,?,?,Now(),Now());";

    private String delivery_categories = "INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";

    private String merchant_online_payment_16 = "UPDATE u201212290_agilesqa.merchant_online_payment_receiveds SET amount=amount-(amount*20/100) WHERE merchant_id = ? ;";

    public String socialLinks_17 = "SELECT name,link FROM  u201212290_agilesqa.social_links;";

    private String merchants_20 = "SELECT * FROM u201212290_agilesqa.merchants WHERE address REGEXP '[1-9]' LIMIT 1;";






}
