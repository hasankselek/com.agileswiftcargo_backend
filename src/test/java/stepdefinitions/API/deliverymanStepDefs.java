package stepdefinitions.API;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;
import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.nullValue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class deliverymanStepDefs extends BaseTest {


    Pojo hubAdd;
    Gson gson = new Gson();

    String reqBody;




    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int},{int},{string},{string},{string},{string},{string},{string},{string} and {string}")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int dataIndex, int user_id,int status,String delivery_charge, String pickup_charge, String return_charge, String current_balance, String opening_balance, String driving_license_image_id, String created_at,String updated_at)  {

        repJP = response.jsonPath();



        assertEquals(user_id, repJP.getInt("[" + dataIndex + "].user_id"));


        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertEquals(delivery_charge, repJP.getString("[" + dataIndex + "].delivery_charge"));
        assertEquals(pickup_charge, repJP.getString("[" + dataIndex + "].pickup_charge"));
        assertEquals(return_charge, repJP.getString("[" + dataIndex + "].return_charge"));
        assertEquals(current_balance, repJP.getString("[" + dataIndex + "].current_balance"));
        assertEquals(opening_balance, repJP.getString("[" + dataIndex + "].opening_balance"));
        assertNull(driving_license_image_id, repJP.getString("[" + dataIndex + "].driving_license_image_id"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));


    }

    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string}")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, int user_id, int status, String delivery_charge, String pickup_charge, String return_charge, String current_balance,String opening_balance, String driving_license_image_id, String created_at, String updated_at)
    {


        response.then()
                .assertThat()
                .body("data[0].id", equalTo(id),
                        "data[0].user_id", equalTo(user_id),
                        "data[0].status", equalTo(status),
                        "data[0].delivery_charge", equalTo(delivery_charge),
                        "data[0].pickup_charge", equalTo(pickup_charge),
                        "data[0].return_charge", equalTo(return_charge),
                        "data[0].current_balance", equalTo(current_balance),
                        "data[0].opening_balance", equalTo(opening_balance),
                        "data[0].driving_license_image_id", nullValue(),
                        "data[0].created_at", equalTo(created_at),
                        "data[0].updated_at", equalTo(updated_at));



    }



    @Given("The api user prepares a POST request containing {string}, {string}, {string}, {int}, {string}, {int}, {int} information to send to the api deliverymanadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_deliverymanadd_endpoint(String name, String mobile, String email, int password, String address, int hub_id, int status) {


        requestBody.put("name",name);
        requestBody.put("mobile",mobile);
        requestBody.put("email",email);
        requestBody.put("password",password);
        requestBody.put("address",address);
        requestBody.put("hub_id",hub_id);
        requestBody.put("status",status);

        reqBody = requestBody.toString();

        System.out.println("POST Request Body : " + requestBody);

    }



    @Given("The api user sends a  request and saves the returned response to.")
    public void the_api_user_sends_a_request_and_saves_the_returned_response_to() {
        response=given().spec(spec).contentType(ContentType.JSON).when().body(requestBody.toString()).post(API_Methods.fullPath);
        response.prettyPrint();
    }


    @Given("The api user prepares a POST request containing  {string}  information to send to the api deliverymanadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_deliverymanadd_endpoint(String email) {
        requestBody.put("email",email);
        reqBody=requestBody.toString();
        reqBody = requestBody.toString();

        System.out.println("Post Body : " + requestBody);
    }



    @Given("The api user prepares a patch request to send to the api deliverymanedit endpoint with name, mobile, email, address, delivery_charge, pickup_charge, return_charge")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_deliverymanedit_endpoint_with_name_mobile_email_address_delivery_charge_pickup_charge_return_charge() {
        map=testData.deliverymanRequestBody();
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response=given().spec(spec).contentType(ContentType.JSON).when().body(map).patch(API_Methods.fullPath);

    }

    @Given("The api user prepares a patch request to send to the api deliverymanedit endpoint.\\({string})")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_deliverymanedit_endpoint(String name) {
        requestBody.put("name",name);

    }


    @Given("The api user verifies that the id information in the returned response body is the same as the id path parameter written in the deliverymanendpoint.")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_deliverymanendpoint() {
        map = response.as(HashMap.class);

        String pathId = String.valueOf(API_Methods.id);

        Assert.assertEquals(pathId,((Map) (map.get("Delivery Man"))).get("id"));
    }

    @Given("BThe api user verifies that the data Deleted id information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void b_the_api_user_verifies_that_the_data_deleted_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        map = response.as(HashMap.class);

        String pathId = String.valueOf(API_Methods.id);

        Assert.assertEquals(pathId,((Map) (map.get("data"))).get("Deleted id"));
    }


    @Given("The api user verifies that the data in the response body {int} includes {string}, {string}, {string}, {string}")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(int id, String user_id, String name, String email, String mobile) {
        repJP = response.jsonPath();

        assertEquals(user_id, repJP.getString("[" + id + "].user.id"));
        assertEquals(name, repJP.getString("[" + id + "].user.name"));
        assertEquals(email, repJP.getString("[" +  id + "].user.email"));
        assertEquals(mobile, repJP.getString("[" + id + "].user.mobile"));


    }

    @Given("The api user sends a PATCH request and saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        response=given().spec(spec).contentType(ContentType.JSON).when().body(map).patch(API_Methods.fullPath);
    }


}



