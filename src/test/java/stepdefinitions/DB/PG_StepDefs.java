package stepdefinitions.DB;

import Manage.Manage;
import io.cucumber.java.bs.I;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.it.Ma;
import io.cucumber.java.sl.In;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Assert;
import utilities.DB_Utilities.JDBCMethods;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static HelperDB.JDBC_Structure_Methods.*;

public class PG_StepDefs extends Manage {


    int flag = 0;
    List<Integer> merchantIdList;
    public static Map<Integer, String> sozialLinksMap;


    Sheet tableName;
    FileInputStream fileInputStream;
    Workbook workbook;

    @Given("The user connect to excellTabels")
    public void the_user_connect_to_excelltabels() throws IOException {
        fileInputStream = new FileInputStream("jdbc:mysql://195.35.59.63:3306/u201212290_agilesqa");//"jdbc:mysql://u201212290_agilesuserqa:xL9vnKqYw|3@195.35.59.63:3306/u201212290_agilesqa"

        workbook = WorkbookFactory.create(fileInputStream);
        tableName = workbook.getSheet("tableName");
    }


    @Given("Prepare query for update the deducting 20 percent from the amount of id {int} in the merchant_online_payment_received table")
    public void prepare_query_for_update_the_deducting_20_percent_from_the_amount_of_id_in_the_merchant_online_payment_received_table(int expectedId) throws SQLException {


        query = getMerchant_online_payment_16();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setInt(1, expectedId);

        for (int i = 0; i < merchantIdList.size(); i++) {
            if (expectedId == merchantIdList.get(i)) {
                flag++;
            }
        }
    }


    @When("Verify that row of this id affected")
    public void verify_that_row_of_this_id_affected() throws SQLException {
        int intResultSet = preparedStatement.executeUpdate();

        Assert.assertEquals(flag, intResultSet);
    }

    @Given("Prepare query for DELETE the address cell with a numeric expression in the address information")
    public void prepare_query_for_delete_the_address_cell_with_a_numeric_expression_in_the_address_information() {
        query = getMerchants_20();
        preparedStatement = getPraperedStatement(query);

    }

    @When("Verify that one row affected")
    public void verify_that_one_row_affected() throws SQLException {
        int resultSet = preparedStatement.executeUpdate();
        Assert.assertEquals(1, resultSet);
    }

    @Given("Prepare query for identifying the URL addresses in the social_links table that aren't valid link.")
    public void prepare_query_for_identifying_the_url_addresses_in_the_social_links_table_that_aren_t_valid_link() throws SQLException {
        query = getSozialLinks();
        resultSet = getStatement().executeQuery(query);
    }

    @When("Verify that URL address of links are valid.")
    public void verify_that_url_address_of_links_are_valid() throws SQLException {
        List<String> inCorrectLinksList = new ArrayList<>();
        sozialLinksMap = new HashMap<>();

        boolean hasRows = false;
        while (resultSet.next()) {
            hasRows = true;

            Map<Integer, String> sozialLinksMap = new HashMap<>();
            sozialLinksMap.put(1, "https://www.facebook.com");
            sozialLinksMap.put(2, "https://www.instagram.com");
            sozialLinksMap.put(3, "https://www.twitter.com");
            sozialLinksMap.put(4, "https://www.youtube.com");
            sozialLinksMap.put(5, "https://www.whatsapp.com");
            sozialLinksMap.put(6, "https://www.skype.com");
            sozialLinksMap.put(7, "https://www.linkedin.com/");

            Integer id = resultSet.getInt("id");
            String link = resultSet.getString("link");


            if (!link.matches("^(http|https)://.+$")) {
                inCorrectLinksList.add(link);
                Assert.assertFalse(inCorrectLinksList.isEmpty());
            } else {
                System.out.println("The structure of all links are true");
            }
        }

    }

    @When("Verify that URL address of links until entire row with name column compared.")
    public void verify_that_url_address_of_links_until_entire_row_with_name_column_compared() throws SQLException {

        query = getSozialLinks();

        Map<String, String> expectedUrls = new HashMap<>();
        expectedUrls.put("facebook", "https://www.facebook.com");
        expectedUrls.put("Instagram", "https://www.instagram.com");
        expectedUrls.put("Twitter", "https://www.twitter.com");
        expectedUrls.put("Youtube", "https://www.youtube.com");
        expectedUrls.put("Whatsapp", "https://www.whatsapp.com");
        expectedUrls.put("Skype", "https://www.skype.com");
        expectedUrls.put("Linkedin", "https://www.linkedin.com/");

        boolean hasRows = false;
        while (resultSet.next()) {
            hasRows = true;
            String name = resultSet.getString("name");
            String link = resultSet.getString("link");
            String expectedUrl = expectedUrls.get(name);

            Assert.assertTrue(expectedUrl.equals(link));
            System.out.println("Correct: " + name + " ---> " + link);

            if (hasRows != true) {

                Assert.assertFalse(expectedUrl.equals(link));
                System.out.println("Incorrect: " + name + " ---> " + link);
            }
        }

    }
}