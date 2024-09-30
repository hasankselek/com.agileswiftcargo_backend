package stepdefinitions.API;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class merchantShopStepDefs extends BaseTest {

    Pojo hubAdd;
    Gson gson = new Gson();

    // list Bugra ///
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

    // id Bugra //
    @Given("The api user verifies the information in the response body for the entry with the specified index, including {int}, {int}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int id, int merchant_id, String name, String contact_no, String address, int status, int default_shop, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "merchant_id", equalTo(merchant_id),
                        "name", equalTo(name),
                        "contact_no", equalTo(contact_no),
                        "address", equalTo(address),
                        "status", equalTo(status),
                        "default_shop", equalTo(default_shop),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));
    }

    // shop Add Bugra //
    @Given("The api user prepares a POST request containing {int}, {string}, {string}, {string} ve {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_ve_information_to_send_to_the_api_shopadd_endpoint(int merchant_id, String name, String contact_no, String address, int status) {

        API_Common_Stepdefinitions.requestBody = builder
                .addParameterForJSONObject("merchant_id", merchant_id)
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("contact_no", contact_no)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

    }

    @Given("The api user sends a {string} request and saves the returned response. bugra")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody.toString());
        }
    }

    @Given("The api user prepares a POST request containing, {string}, {string}, {string} ve {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_ve_information_to_send_to_the_api_shopadd_endpoint(String name, String contact_no, String address, int status) {
        requestBody.put("name", name)
                .put("contact_no", contact_no)
                .put("address", address)
                .put("status", status);
    }


    @Given("The api user prepares a patch request to send to the api shopedit endpoint.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_shopedit_endpoint() {
        map = testData.hubRequestBody();

        System.out.println("Patch body : " + map);
    }

    @Given("The api user prepares a PATCH request containing {int}, {string}, {string}, {string} ve {int} information to send to the api shopedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_ve_information_to_send_to_the_api_shopadd_endpoint(Integer merchant_id, String name, String contact_no, String address, Integer status) {

        API_Common_Stepdefinitions.requestBody = builder
                .addParameterForJSONObject("merchant_id", merchant_id)
                .addParameterForJSONObject("name", name)
                .addParameterForJSONObject("contact_no", contact_no)
                .addParameterForJSONObject("address", address)
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();

    }

    @Given("The api user prepares a PATCH request containing information to send to the api shopedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_information_to_send_to_the_api_shopedit_endpoint() {
        API_Common_Stepdefinitions.requestBody = builder.buildUsingMap();

    }

    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_bad_request(String httpMethod) {

        String response = (API_Common_Stepdefinitions.requestBody == null) ? API_Methods.tryCatchRequest(httpMethod, null) : API_Methods.tryCatchRequest(httpMethod, API_Common_Stepdefinitions.requestBody);
        assertEquals(configLoader.getApiConfig("badRequestExceptionMessage"), response);

    }

    @Given("The api User verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        API_Methods.assertBody(key, value);

    }

}
