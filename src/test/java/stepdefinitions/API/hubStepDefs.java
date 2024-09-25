package stepdefinitions.API;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;
import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class hubStepDefs extends BaseTest {


    Pojo hubAdd;
    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.
    String requestBody;

    // ************************************************ api/hub/list ******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String name, String phone, String address, String current_balance, int status, String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(name, repJP.getString("data[" + dataIndex + "].name"));
        assertEquals(phone, repJP.getString("data[" + dataIndex + "].phone"));
        assertEquals(address, repJP.getString("data[" + dataIndex + "].address"));
        assertEquals(current_balance, repJP.getString("data[" + dataIndex + "].current_balance"));
        assertEquals(status, repJP.getInt("data[" + dataIndex + "].status"));
        assertEquals(created_at, repJP.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("data[" + dataIndex + "].updated_at"));
    }
    // ********************************************************************************************************************

    // ************************************************ api/hub/{id} ******************************************************
    @Given("The api user verifies that the data in the response body includes {int}, {string}, {string}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String name, String phone, String address, String current_balance, int status, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "name", equalTo(name),
                        "phone", equalTo(phone),
                        "address", equalTo(address),
                        "current_balance", equalTo(current_balance),
                        "status", equalTo(status),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));
    }
    // ********************************************************************************************************************

    // ************************************************ api/hub/add *******************************************************
    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api hubadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(String phone, String address) {
        requestBody = builder
                .addParameterForMap("phone", phone)
                .addParameterForMap("address", address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data() {
        hubAdd = new Pojo();

    }
    // ********************************************************************************************************************

    // ******************************************* api/hub/edit/{id} ******************************************************
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api hubedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_hubedit_endpoint(String name, String phone, String address) {
        requestBody = builder
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("phone", phone)
                .addParameterForJSONObject("address", address)
                .buildUsingJSONObject();

        System.out.println("PATCH Request Body : " + requestBody);
    }
    // ********************************************************************************************************************

    // ******************************************* api/hub/delete *********************************************************

    @Given("The api user verifies that the data Deleted id information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_data_deleted_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        map = response.as(HashMap.class);

        String pathId = String.valueOf(API_Methods.id);

        Assert.assertEquals(pathId,((Map) (map.get("data"))).get("Deleted ID"));
    }

    @Given("The api user prepares a patch request to send to the api hubedit endpoint.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_hubedit_endpoint() {
        map = testData.hubRequestBody();

        System.out.println("Patch body : " + map);
    }

    @Given("The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        repJP = response.jsonPath();

        Assert.assertEquals(API_Methods.id,repJP.getInt("data[0].id"));
    }

    @Given("The api user prepares a {string} request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data(String request) {
        Pojo hubAdd = new Pojo();

    }

    @Given("The api user verifies that name is {string}")
    public void the_api_user_verifies_that_name_is(String value) {
        map = response.as(HashMap.class);

        requestBody = gson.toJson(map);
        Assert.assertEquals(value, map.get("name"));
    }


}
