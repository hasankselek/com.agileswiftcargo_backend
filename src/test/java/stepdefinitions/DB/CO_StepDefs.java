package stepdefinitions.DB;

import HelperDB.JDBC_Structure_Methods;
import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import HelperDB.CommonData;
import HelperDB.DeliveryCategories;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import static HelperDB.CommonData.result;
import static HelperDB.DeliveryCategories.generateCategory;
import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.preparedStatement;
import static org.junit.Assert.assertEquals;


public class CO_StepDefs extends Manage {

    int generatedId = -1;
    ResultSet rs;


    @Given("Prepare query to insert {int} data entry into the deliverycategories table.")
    public void prepare_query_to_insert_data_entry_into_the_deliverycategories_table(Integer count) throws SQLException {
        query = getDelivery_categories();
        PreparedStatement preparedStatement = getPraperedStatement(query);
        List<DeliveryCategories> categories = generateCategory(count);
        int flag = 0;
        for (DeliveryCategories category : categories) {
            preparedStatement.setString(1, categories.get(flag).getTitle());
            preparedStatement.setInt(2, categories.get(flag).getStatus());
            preparedStatement.setInt(3, categories.get(flag).getPosition());
            preparedStatement.setTimestamp(4, categories.get(flag).getCreatedAt());
            preparedStatement.setTimestamp(5, categories.get(flag).getCreatedAt());

            preparedStatement.addBatch();// her bir kategori için bir batch eklenir.
            flag++;
            if (flag == categories.size()) {
                result = preparedStatement.executeBatch();
            }
        }
    }
    @Given("Verify bulk {int} data added to the table.")
    public void verify_bulk_data_added_to_the_table(int rowCount) {
        System.err.println(result.length + "RECORD IS Successfully Added");
        assertEquals(rowCount,result.length);
    }

    @Given("Database closed.")
    public void database_closed() {
        closeConnection();
    }

    @Given("Prepare query with status to insert {int} data entry into the deliverycategories table.")
    public void prepare_query_with_status_to_insert_data_entry_into_the_deliverycategories_table(Integer count) throws SQLException {
        query = getDelivery_categories();
        PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
      //  PreparedStatement preparedStatement = getPraperedStatement(query);
        List<DeliveryCategories> categories = generateCategory(count);
        int flag = 0;
        for (DeliveryCategories category : categories) {
            preparedStatement.setString(1, categories.get(flag).getTitle());
            preparedStatement.setInt(2, 0);
            preparedStatement.setInt(3, categories.get(flag).getPosition());
            preparedStatement.setTimestamp(4, categories.get(flag).getCreatedAt());
            preparedStatement.setTimestamp(5, categories.get(flag).getCreatedAt());

            preparedStatement.addBatch();// her bir kategori için bir batch eklenir.

            flag++;
            if (flag == categories.size()) {
                result = preparedStatement.executeBatch();
            }
        }

        System.out.println("result length:  " + result.length);


        if (result.length > 0) {
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1); // Son eklenen satırın ID'si
                    System.out.println("Eklenen kaydın ID'si: " + generatedId);
                } else {
                    System.out.println("ID alınamadı.");
                }
            }

    }


        }

    @Given("Delete this id and status to the deliverycategories table")
    public void delete_this_id_and_status_to_the_deliverycategories_table() throws SQLException {
        if (generatedId != -1) {
            query = getDelete_delivery_categories();
         //   preparedStatement = getPraperedStatement(query);
            PreparedStatement deleteStatement = connection.prepareStatement(query);
            deleteStatement.setInt(1, generatedId);

            int rowsDeleted = deleteStatement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Kayıt başarıyla silindi.");
            } else {
                System.out.println("Silinecek kayıt bulunamadı.");
            }
        }
    }

    @Given("Verify the the address information of the data whose name information starts with {string} from the hubs table.")
    public void verify_the_the_address_information_of_the_data_whose_name_information_starts_with_from_the_hubs_table(String string) {
        query = getSelect_hubs();
        try {
            rs = getStatement().executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    @Given("Verify the {string} information Results are obtained.")
    public void verify_the_information_results_are_obtained(String string) throws SQLException {

        List<String> address = new ArrayList<String>();
        List<String> addressValues = new ArrayList<String>(Arrays.asList("San Francisco, California", "Seattle, Washington", "San Diego, California"));

        while (rs.next()) {
            address.add(rs.getString("address"));
        }
        for (int i = 0; i < address.size(); i++) {
            assertEquals(addressValues.get(i), address.get(i));
        }



}
    }







