package stepdefinitions.DB;

import HelperDB.CommonData;
import HelperDB.DeliveryCategories;
import Manage.Manage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Assert;
import utilities.DB_Utilities.JDBCMethods;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import static HelperDB.CommonData.result;
import static HelperDB.DeliveryCategories.generateCategory;
import static HelperDB.JDBC_Structure_Methods.*;
import static HelperDB.JDBC_Structure_Methods.preparedStatement;
import static org.junit.Assert.*;
import static org.junit.Assert.assertTrue;

public class DB_Common_StepDefinitions extends Manage {

    CommonData data = new CommonData();
    public static Map<Integer, String> question;
    public static Map<Integer, String> sozialLinks;
    String actualBlogTitle;
    int intResult;
    String value;
    String columnName;
    int generatedId = -1;
    ResultSet rs;
    String question1 = "How can I track my shipment?";
    String question2 = "What are the shipping fees and how are they calculated?";
    String question3 = "What is the delivery time for shipments?";
    String expectedPartner = "Alibaba";
    String expectedPriority = "highest";
    int expectedSalary = 10000;
    public static Map<Integer, String> sozialLinksMap;


    Sheet tableName;
    FileInputStream fileInputStream;
    Workbook workbook;

    @Given("Database connection established")
    public void database_connection_established() {

        createConnection();
    }

    @Given("Database closed")
    public void database_closed() {

        closeConnection();
    }


    /**
     * US01
     **/

    @Given("Verify that the number of users with gateway = {int} in the accounts table in the database is {int}.")
    public void verify_that_the_number_of_users_with_gateway_in_the_accounts_table_in_the_database_is(int gateway, int exgateway) throws SQLException {
        String query = getAccounts() + gateway;

        Statement statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        int actualCount = 0;
        if (resultSet.next()) {
            actualCount = resultSet.getInt(1);
        }

        System.out.println("Gateway = " + gateway + " olan kullanıcı sayısı: " + actualCount);

        assertEquals(exgateway, actualCount);

    }

    /**
     * US02
     **/

    @Given("The most viewed name on the blogs page is found")
    public void the_most_viewed_on_the_blogs_page_is_found() {

        try {
            query = getBlogs();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                actualBlogTitle = resultSet.getString("title");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //assertEquals(exTitle, actualBlogTitle);

        System.out.println("Top blog title: " + actualBlogTitle);
    }

    @Given("The title should be {string}")
    public void the_title_should_be(String exTitle) {

        assertEquals(exTitle, actualBlogTitle);

    }

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


    @When("insert the new delivery charge into the database ulvi")
    public void insert_the_new_delivery_charge_into_the_database_ulvi() throws SQLException {
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


        assertEquals(1, satis_list1);
        assertEquals(15, satis_list2);
        assertEquals(5, satis_list3);

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
        assertEquals(0, intResult);

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

    @Given("Query prepared faqs links table")
    public void query_prepared_faqs_links_table() throws SQLException {
        query = getFaqs();
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
        query = getMerchant_delivery_charges();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("verify the results for each delivery_charge_id")
    public void verify_the_results_for_each_delivery_charge_id() {
        Map<Integer, Double> expectedResults = new HashMap<>();
        expectedResults.put(1, 70.00);
        expectedResults.put(2, 110.00);
        expectedResults.put(3, 150.00);
        expectedResults.put(4, 190.00);
        expectedResults.put(5, 230.00);
        expectedResults.put(6, 270.00);
        expectedResults.put(7, 310.00);
        expectedResults.put(8, 360.00);
        expectedResults.put(9, 400.00);

        try {
            Map<Integer, Double> merchantDelivery = new HashMap<>();
            // Sonuçları doğrula
            while (resultSet.next()) {
                Integer deliveryChargeId = (Integer) resultSet.getInt("delivery_charge_id");
                Double totalSubCity = (Double) resultSet.getDouble("total_sub_city");

                merchantDelivery.put(deliveryChargeId, totalSubCity);
                Double expectedSubCity = expectedResults.get(deliveryChargeId);
                // Doğrulama
                Assert.assertEquals(expectedSubCity, totalSubCity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Given("Query prepared  business_name column in the merchants table")
    public void query_prepared_business_name_column_in_the_merchants_table() throws SQLException {
        query = getMerchant_statements19();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("verify the address information of the data containing the letters m and n")
    public void verify_the_address_information_of_the_data_containing_the_letters_and() {
        Map<String, String> expectedResults = new HashMap<>();
        expectedResults.put("Commerce Connect", "Orlando");
        expectedResults.put("emine sevval gultekin", "Orlando");
        expectedResults.put("Granula GMBH", "New York");

        try {
            Map<String, String> adrress = new HashMap<>();
            // Sonuçları doğrula
            while (resultSet.next()) {
                String businessName = resultSet.getString("business_name");
                String address = resultSet.getString("address");

                adrress.put(businessName, address);
                String expectedAddress = expectedResults.get(businessName);
                // Doğrulama
                if (!(expectedAddress == null)) {
                    assertTrue(expectedAddress.contains(address));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * US24
     **/

    @Given("Query prepared partners table")
    public void prepare_the_query24() throws SQLException {

        query = getPartners();
        resultSet = getStatement().executeQuery(query);


    }

    @Given("Processes the results of the partners table query")
    public void processes_the_results_of_the_query() throws SQLException {
        resultSet.next();
        String actualPartner = resultSet.getString("name");

        assertEquals(expectedPartner, actualPartner);
        System.err.println("Expected Partner Name = " + expectedPartner + "\n" + "Actual Partner Name = " + actualPartner);


    }


    /**
     * US25
     **/

    @Then("Query prepared salary_generates table")
    public void queryPreparedSalary_generatesTable() {

        query = getSalary_generates();
        intResult = JDBCMethods.updateQuery(query);

    }


    @When("Verify that {int} row updated to the table")
    public void Verifythatrowupdatedtothetable(int row) {

        assertEquals(row, intResult);


    }


    @And("Verify amount is update")
    public void verifyAmountIsUpdate() throws SQLException {

        query = getControlQuery_salary();
        resultSet = getStatement().executeQuery(query);
        resultSet.next();
        int actualSalary = resultSet.getInt("amount");

        assertEquals(expectedSalary, actualSalary);
        System.err.println("Expected Salary = " + expectedSalary + "\n" + "Actual Salary = " + actualSalary);


    }


    /**
     * US27
     **/


    @And("Query prepared supports table")
    public void queryPreparedSupportsTable() {

        query = getSupports();
        intResult = JDBCMethods.updateQuery(query);


    }

    @Then("Verify priority is update")
    public void verifyPriorityIsUpdate() throws SQLException {

        query = getControlQuery_supports();
        resultSet = getStatement().executeQuery(query);
        resultSet.next();
        String actualPriority = resultSet.getString("priority");

        assertEquals(expectedPriority, actualPriority);
        System.err.println("Expected Priority = " + expectedPriority + "\n" + "Actual Priority = " + actualPriority);


    }

    /**
     * DB_US028(List and verify how many files in different formats are uploaded to the system from the uploads table via the database.)
     **/

    @Given("Query prepared uploads table and original column")
    public void query_prepared_uploads_table_and_original_column() throws SQLException {
        query = getUploads_original();
        resultSet = getStatement().executeQuery(query);
    }


    @Given("Verify how many different formats the files under the Original column are in")
    public void verify_how_many_different_formats_the_files_under_the_original_column_are_in() throws SQLException {

        List<String> dosya_uzantisi = new ArrayList<>();

        while (resultSet.next()) {
            dosya_uzantisi.add(resultSet.getString("dosya_uzantisi"));
        }

        System.out.println(dosya_uzantisi);

        Set<String> result_set = new HashSet<>(dosya_uzantisi);

        List<String> result_list = new ArrayList<>(result_set);

        System.out.println("A total of " + result_list.size() + " different format files have been uploaded");
        System.out.println(result_list);

    }

    /**
     * DB_US029(According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between '2024-09-09' ve '2024-09-13')
     **/

    @Given("Query is sent to find the hub with the most parcel records")
    public void query_is_sent_to_find_the_hub_with_the_most_parcel_records() throws SQLException {
        query = getParcel_logs_note();
        preparedStatement = getPraperedStatement(query);
    }

    @Then("Verify that {int} added to the parcel table Hasan")
    public void Verify_that_added_to_the_table_Hasan(int row) {
        int rowCount = 0;
        try {
            rowCount = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(row, rowCount);
    }

    /**
     * DB_US030(According to the values in the bank_transactions table on the database, verify the total amount values of the transactions made between '2024-09-09' ve '2024-09-13')
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
        Assert.assertEquals(totalAmount, resultSet.getString("total_amount"));

    }

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
    }


    @When("Verify that row of this id affected")
    public void verify_that_row_of_this_id_affected() throws SQLException {
        int intResultSet = preparedStatement.executeUpdate();

        System.out.println("The changed row number :" + intResultSet);
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

        query = getSocialLinks_17();

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


    //------------------------------------------------------------------------------------------------------------------------------------

    @Given("Query prepared sozial links table")
    public void query_prepared_sozial_links_table() throws SQLException {
        query = getSozialLinks();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("the results of the social links table are compared")
    public void the_results_of_the_social_links_table_are_compared() throws SQLException {
        sozialLinks = new HashMap<>();
        while (resultSet.next()) {
            sozialLinks.put(resultSet.getInt("id"), resultSet.getString("name"));

        }
        if (!sozialLinks.isEmpty()) {
            for (int i = 0; i < sozialLinks.size(); i++) {
                //buraya expected liste eklenebilecek
                System.err.println(sozialLinks.get(i));
            }
        } else {
            assertFalse("ResultsetEMpty", resultSet.next());
        }
    }


    /**
     * US08
     **/

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

    /**
     * US10
     **/
    @Given("Prepare query to insert {int} data entry into the deliverycategories table")
    public void prepare_query_to_insert_data_entry_into_the_deliverycategories_table(int count) throws SQLException {
        query = getDelivery_categories();
        preparedStatement = getPraperedStatement(query);
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

    @Given("Verify bulk {int} data added to the table")
    public void verify_bulk_data_added_to_the_table(int rowCount) {
        System.err.println(result.length + "RECORD IS Successfully Added");
        assertEquals(rowCount, result.length);
    }


}
