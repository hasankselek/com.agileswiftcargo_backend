package stepdefinitions.DB;

import Manage.Manage;
import io.cucumber.java.en.Given;
import org.junit.Assert;

import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static HelperDB.JDBC_Structure_Methods.*;

public class HK_StepDefs extends Manage {

    int rowsAffected;

    /**
     DB_US028(List and verify how many files in different formats are uploaded to the system from the uploads table via the database.)
     **/

    @Given("Query prepared uploads table and original column")
    public void query_prepared_uploads_table_and_original_column() throws SQLException {
        query = getUploads_original();
        resultSet = getStatement().executeQuery(query);
    }


    @Given("Verify how many different formats the files under the Original column are in")
    public void verify_how_many_different_formats_the_files_under_the_original_column_are_in() throws SQLException {

        List<String> dosya_uzantisi = new ArrayList<>();

        while(resultSet.next()){
            dosya_uzantisi.add(resultSet.getString("dosya_uzantisi"));
        }

        System.out.println(dosya_uzantisi);

        Set<String> result_set = new HashSet<>(dosya_uzantisi);

        List<String> result_list = new ArrayList<>(result_set);

        System.out.println("A total of "+ result_list.size() +" different format files have been uploaded");
        System.out.println(result_list);

    }

    /**
     DB_US029(According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between '2024-09-09' ve '2024-09-13')
     **/

    @Given("Query is sent to find the hub with the most parcel records")
    public void query_is_sent_to_find_the_hub_with_the_most_parcel_records() throws SQLException {
       query = getParcel_logs_note();
       rowsAffected = statement.executeUpdate(query);
    }

    @Given("The hub with the most parcel logs will have its rating updated to Tebrikler")
    public void the_hub_with_the_most_parcel_logs_will_have_its_rating_updated_to() throws SQLException {



    }

    /**
      DB_US030(According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between '2024-09-09' ve '2024-09-13')
     **/

    @Given("Prepare query for amount calculation between dates")
    public void prepare_query_for_amount_calculation_between_dates() throws SQLException {

       query = getBank_transaction_amount();
       resultSet = getStatement().executeQuery(query);
    }
    @Given("Verify that the total amount is {string}")
    public void verify_that_the_total_amount_is(String totalAmount) throws SQLException {

        resultSet.next();
        System.out.println(resultSet.getString("total_amount"));
        Assert.assertEquals(totalAmount,resultSet.getString("total_amount"));

    }



}
