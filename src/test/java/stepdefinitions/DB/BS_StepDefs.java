package stepdefinitions.DB;

import HelperDB.JDBC_Structure_Methods;
import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertEquals;
import utilities.DB_Utilities.JDBCMethods;

public class BS_StepDefs extends Manage {
    int intResult;
    String value;
    String columnName;


            // US18 //
    @Given("Query prepared merchant_statements table")
    public void query_prepared_merchant_statements_table() throws SQLException {
        query = getMerchant_statements();
        resultSet = getStatement().executeQuery(query);

    }

    @Given("Must view transactions in groups day by day")
    public void must_view_transactions_in_groups_day_by_day() throws SQLException {
        resultSet.next();
        int satis_list1 = resultSet.getInt("total_satis");
        resultSet.next();
        int satis_list2 = resultSet.getInt("total_satis");
        resultSet.next();
        int satis_list3 = resultSet.getInt("total_satis");


        assertEquals(1,satis_list1);
        assertEquals(15,satis_list2);
        assertEquals(5,satis_list3);

    }

    @Given("Validates grouped results")
    public void validates_grouped_results() throws SQLException {

        JDBCMethods.printResultSet(resultSet);

    }


            // US22 //
    @Given("Query prepared parcel_logs table")
    public void query_prepared_parcel_logs_table() {

        query = getParcel_logs();
        int intResult = updateQuery(query);

    }
    @Given("Address change is made")
    public void address_change_is_made() {
        assertEquals(0,intResult);

    }

           // US23 //

    @Given("The column ismi_ali_olanlar is created")
    public void The_column_ismi_ali_olanlar_is_created() throws SQLException {
        query = getParcels();
        //preparedStatement=JDBC_Structure_Methods.getPraperedStatement(query);
        // Yeni column ekleniyor
        Statement stmt = connection.createStatement();
        stmt.executeUpdate(query);

    }
    @Given("The column is updated")
    public void The_column_is_updated() throws SQLException {
        //String updateQuery = "UPDATE parcels SET ismi_ali_olanlar = 1 WHERE customer_name LIKE '%ali%'";
        // statement.executeUpdate(updateQuery);
        columnName = "ismi_ali_olanlar";
        String query = "SELECT ismi_ali_olanlar FROM parcels WHERE " + columnName + " LIKE ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        value = null;
        stmt.setString(1, "%" + value + "%");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            assertEquals("ismi_ali_olanlar should be 1", 1, rs.getInt("ismi_ali_olanlar"));

        }
    }

    
    @Given("The information is verified.")
    public void the_information_is_verified() throws SQLException {

        String query = "SELECT ismi_ali_olanlar FROM parcels WHERE " + columnName + " NOT LIKE ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, "%" + value + "%");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            assertEquals("ismi_ali_olanlar should be 0", 0, rs.getInt("ismi_ali_olanlar"));
        }

    }

}
