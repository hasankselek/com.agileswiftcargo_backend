package stepdefinitions.DB;

import Manage.Manage;
import io.cucumber.java.en.Given;
import org.junit.Assert;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.query;
import static org.junit.Assert.*;

public class GCA_StepDefs extends Manage {
        public static Map<Integer, String> question;
        String question1 ="How can I track my shipment?";
        String question2 ="What are the shipping fees and how are they calculated?";
        String question3 ="What is the delivery time for shipments?";

    @Given("Query prepared faqs links table")
    public void query_prepared_faqs_links_table() throws SQLException {
        String query = "select id,question from u201212290_agilesqa.faqs order by updated_at asc limit 3;";
        resultSet = getStatement().executeQuery(query);
    }
    @Given("Compare Question from the result set of Faqs")
    public void compare_question_from_the_result_set_of_faqs() throws SQLException {
        question = new HashMap<>();
        while (resultSet.next()) {
            question.put(resultSet.getInt("id"), resultSet.getString("question"));

        }
        if (!question.isEmpty()) {

                assertTrue(question.containsValue(question1));
                assertTrue(question.containsValue(question2));
                assertTrue(question.containsValue(question3));

                //buraya expected liste eklenebilecek

        } else {
            assertFalse("ResultsetEMpty", resultSet.next());
        }

    }
    @Given("Query prepared merchant_delivery_charges links table")
    public void query_prepared_merchant_delivery_charges_links_table() throws SQLException {
        String query = "SELECT delivery_charge_id, SUM(sub_city) AS total_sub_city FROM merchant_delivery_charges WHERE merchant_id = 2 GROUP BY delivery_charge_id;";
        resultSet = getStatement().executeQuery(query);
    }
    @Given("verify the results for each delivery_charge_id")
    public void verify_the_results_for_each_delivery_charge_id() {
        Map<Integer, Double> expectedResults = new HashMap<>();
        expectedResults.put(1,70.00);
        expectedResults.put(2,110.00);
        expectedResults.put(3,150.00);
        expectedResults.put(4,190.00);
        expectedResults.put(5,230.00);
        expectedResults.put(6,270.00);
        expectedResults.put(7,310.00);
        expectedResults.put(8,360.00);
        expectedResults.put(9,400.00);

        try {
             Map<Integer,Double> merchantDelivery = new HashMap<>();
            // Sonuçları doğrula
            while (resultSet.next()) {
                Integer deliveryChargeId = (Integer) resultSet.getInt("delivery_charge_id");
                Double totalSubCity = (Double) resultSet.getDouble("total_sub_city");

                merchantDelivery.put(deliveryChargeId,totalSubCity);
                Double expectedSubCity = expectedResults.get(deliveryChargeId);
                // Doğrulama
                Assert.assertEquals(expectedSubCity,totalSubCity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Given("Query prepared  business_name column in the merchants table")
    public void query_prepared_business_name_column_in_the_merchants_table() throws SQLException {
        String query ="SELECT  business_name, address FROM merchants WHERE " +
            "UPPER(business_name) IS NOT NULL " +
            "AND business_name != '' " +
            "AND UPPER(business_name) LIKE '%M%' " +
            "AND UPPER(business_name) LIKE '%N%' " +
            "AND UPPER(business_name) != UPPER('<business_name>');";
        resultSet = getStatement().executeQuery(query);
    }
    @Given("verify the address information of the data containing the letters m and n")
    public void verify_the_address_information_of_the_data_containing_the_letters_and() {
        Map<String, String> expectedResults = new HashMap<>();
        expectedResults.put("Commerce Connect","Orlando");
        expectedResults.put("emine sevval gultekin","Orlando");
        expectedResults.put("Granula GMBH","New York");

        try {
            Map<String,String> adrress = new HashMap<>();
            // Sonuçları doğrula
            while (resultSet.next()) {
                String businessName = resultSet.getString("business_name");
                String address = resultSet.getString("address");

                adrress.put(businessName,address);
                String expectedAddress = expectedResults.get(businessName);
                // Doğrulama
                if(!(expectedAddress==null)){
                     assertTrue(expectedAddress.contains(address));
                 }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

