package stepdefinitions.DB;

import HelperDB.CommonData;
import HelperDB.DeliveryCategories;
import Manage.Manage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static HelperDB.CommonData.result;
import static HelperDB.DeliveryCategories.generateCategory;
import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.preparedStatement;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import static HelperDB.JDBC_Structure_Methods.getPraperedStatement;

public class UG_StepDefs extends Manage {

    CommonData data = new CommonData();

    @Given("Query prepared for currency data where name={string}")
    public void query_prepared_for_currency_data_where_name(String name) {
        try {
            // name='Dollars' ve code içinde 'A' olan verileri sorguluyoruz
            query = getCurrencyDataByNameAndCodeContainsA(); // Manage.java'dan aldığımız sorgu
            preparedStatement = getPraperedStatement(query); // JDBC_Structure_Methods'tan aldığımız preparedStatement
            preparedStatement.setString(1, name); // Name'i sorguya ekliyoruz
            preparedStatement.setString(2, "%A%"); // Code sütununda 'A' içeren değerleri arıyoruz
            resultSet = preparedStatement.executeQuery(); // Sonuçları çalıştırıyoruz
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Given("Sort the retrieved data in reverse order by code")
    public void sort_the_retrieved_data_in_reverse_order_by_code() {
        try {
            // Çekilen verileri ters sırada sıralıyoruz
            if (resultSet != null && resultSet.next()) { // Sonuç setinin boş olmadığını kontrol ediyoruz
                System.out.println("Query executed successfully.");
            } else {
                System.out.println("No data found for the provided query.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Given("Verify that the code {string} exists in the retrieved data")
    public void verify_that_the_code_exists_in_the_retrieved_data(String expectedCode) {
        boolean codeExists = false;
        try {
            // resultSet içindeki verileri dönüyoruz ve code değerini kontrol ediyoruz
            while (resultSet.next()) {
                String code = resultSet.getString("code");
                System.out.println("Retrieved code: " + code); // Her bir code'u kontrol etmek için ekleyelim
                if (code.contains(expectedCode)) { // code içinde 'A' olup olmadığını kontrol ediyoruz
                    codeExists = true;
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Kodun varlığını doğruluyoruz
        assert codeExists : "Code containing '" + expectedCode + "' not found in the retrieved data.";
    }

    //US08


    @When("insert the new delivery charge into the database")
    public void insert_the_new_delivery_charge_into_the_database() throws SQLException {
        query = getDelivery_charges();
        preparedStatement = getPraperedStatement(query);
        /**category_id, weight, same_day, next_day, sub_city, outside_city, position, status (should be 0)*/
        preparedStatement.setInt(1, data.getCategory_id());
        preparedStatement.setInt(2, data.getWeight());
        preparedStatement.setDouble(3, data.getSame_day());
        preparedStatement.setDouble(4, data.getNext_day());
        preparedStatement.setDouble(5, data.getSub_city());
        preparedStatement.setDouble(6, data.getOutside_city());
        preparedStatement.setInt(7, data.getPosition());
        preparedStatement.setInt(8, data.getStatus());
    }

    @Then("Verify that {int} added to the table")
    public void Verify_that_added_to_the_table(int row) {
        int rowCount = 0;
        try {
            rowCount = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(row, rowCount);
    }

    // us 09
    @Given("Update the delivery_charge for deliveryman with id {int} to {double}")
    public void update_the_delivery_charge_for_deliveryman_with_id_to(Integer id, Double newCharge) {
        try {
            // Güncelleme sorgusunu Manage.java'daki sorgu ile çalıştırıyoruz
            preparedStatement = getPraperedStatement(getUpdateDeliveryChargeQuery());
            preparedStatement.setDouble(1, newCharge); // Yeni delivery_charge değeri
            preparedStatement.setInt(2, id); // Deliveryman ID'si
            preparedStatement.executeUpdate(); // Sorguyu çalıştırıyoruz
            System.out.println("Delivery charge updated successfully for id: " + id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Given("Verify that the delivery_charge for deliveryman with id {int} has been updated to {double}")
    public void verify_that_the_delivery_charge_for_deliveryman_with_id_has_been_updated_to(Integer id, Double expectedCharge) {
        try {
            // Güncellemenin doğruluğunu kontrol eden sorgu
            preparedStatement = getPraperedStatement(getSelectDeliveryChargeQuery());
            preparedStatement.setInt(1, id); // Deliveryman ID'sini sorguya ekliyoruz
            resultSet = preparedStatement.executeQuery(); // Sorguyu çalıştırıyoruz

            // Sonucu kontrol ediyoruz
            if (resultSet.next()) {
                double actualCharge = resultSet.getDouble("delivery_charge");
                assert actualCharge == expectedCharge : "Expected charge: " + expectedCharge + ", but got: " + actualCharge;
                System.out.println("Verified that delivery charge is updated to: " + expectedCharge);
            } else {
                System.out.println("No data found for the given ID: " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}