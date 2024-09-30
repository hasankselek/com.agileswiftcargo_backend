package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

public class supportStepDefs extends BaseTest {

    String requestBody;
    @Given("Api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        if (API_Methods.addedId == 0) {
            API_Methods.pathParam(pathParam);
        } else {
            API_Methods.pathParam(pathParam + "/" + API_Methods.addedId);
        }
    }

    @Given("User send a {string} request and saves the returned response")
    public void send_a_get_request_to_the_api_ticket_list_endpoint_with_valid_authorization(String httpMethod) {
        if (requestBody == null || requestBody.isEmpty()) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody);
        }
    }

    @Given("Verify that the response status code is {int}")
    public void verify_that_the_response_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("Send {string} request with invalid token")
    public void send_request_with_invalid_token(String httpMethod) {
        if (requestBody == null) {
            API_Methods.tryCatchRequest(httpMethod, null);
        } else {
            API_Methods.tryCatchRequest(httpMethod, requestBody);
        }
    }

    @Given("Verify message in the response body is {string}")
    public void verify_in_the_response_body(String message) {
        API_Methods.assertBody("message", message);
    }
    @Given("User verifies that the data in the response body includes {int},{int},{int},{string},{string},{string},{string},{string},null,{int},{string} and {string}")
    public void user_verifies_that_the_data_in_the_response_body(int id, int user_id, int department_id, String service, String priority, String subject, String description, String date, int status, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "user_id", equalTo(user_id),
                        "department_id", equalTo(department_id),
                        "service", equalTo(service),
                        "priority", equalTo(priority),
                        "subject", equalTo(subject),
                        "description", equalTo(description),
                        "date", equalTo(date),
                        // "attached_file", equalTo(null),
                        "status", equalTo(status),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));

        // attached_file alanı null mı diye kontrol ediyoruz
        response.then().assertThat().body("attached_file", equalTo(null));
    }
    @Given("Verify that ID in the response body and endpoint ID")
    public void verify_that_id_in_the_response_body_and_endpoint_id() {
        map = response.as(HashMap.class);
        String pathId = String.valueOf(API_Methods.id);
        Assert.assertEquals(pathId,((Map) (map.get("data"))).get("ID"));
    }
    @Given("Update that {int} in the request body and response body")
    public void update_that_status_in_the_request_body_and_response_body(int status) {
        requestBody = builder
                .addParameterForJSONObject("status", status)
                .buildUsingJSONObject();
        String pathId = String.valueOf(status);
        map = response.as(HashMap.class);
        Assert.assertEquals(pathId,((Map) (map.get("data"))).get("status"));
    }
    @Given("Add Ticket that {int},{string},{string},{string},{string},{string} in the request body")
    public void add_Ticket(int department_id, String service,String priority,String subject,String description,String date) {
        requestBody = builder
                .addParameterForJSONObject("department_id", department_id)
                .addParameterForJSONObject("service", service)
                .addParameterForJSONObject("priority", priority)
                .addParameterForJSONObject("subject", subject)
                .addParameterForJSONObject("description", description)
                .addParameterForJSONObject("date", date)
                .buildUsingJSONObject();
       // String pathId = String.valueOf();
       // map = response.as(HashMap.class);
       // Assert.assertEquals(pathId,((Map) (map.get("data"))).get("status"));
    }
    @Given("Send PATCH request without body with {double}")
    public void user_send_a_request(double id) {
        response = given()
                .pathParam("id", id)
                .when()
                .patch("api/ticket/edit/{id}");
    }
}


