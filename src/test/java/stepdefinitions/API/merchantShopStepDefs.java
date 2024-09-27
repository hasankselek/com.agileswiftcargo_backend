package stepdefinitions.API;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import pojos.Pojo;
import static org.junit.Assert.assertEquals;

public class merchantShopStepDefs extends BaseTest {

    Pojo hubAdd;
    Gson gson = new Gson();
    String requestBody;

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {int}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String merchant_id, String name, String contact_no, String address, int status, String default_shop, String created_at, String updated_at) {

        repJP = response.jsonPath();

        assertEquals(merchant_id, repJP.getString("[" + dataIndex + "].merchant_id"));
        assertEquals(name, repJP.getString("[" + dataIndex + "].name"));
        assertEquals(contact_no, repJP.getString("[" + dataIndex + "].contact_no"));
        assertEquals(address, repJP.getString("[" + dataIndex + "].address"));
        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertEquals(default_shop, repJP.getString("[" + dataIndex + "].default_shop"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));


    }

}
