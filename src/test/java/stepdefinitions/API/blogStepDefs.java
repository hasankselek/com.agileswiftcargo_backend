package stepdefinitions.API;

import base.BaseTest;
import com.github.javafaker.Faker;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import utilities.API_Utilities.API_Methods;
import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;


public class blogStepDefs extends BaseTest {
Faker faker=new Faker();





    @Given("The api user prepares a patch request to send to the api blog edit endpoint.")
    public void the_api_user_prepares_a_request_to_send_to_the_api_blog_edit_endpoint() {
        requestBody.put("title", faker.name().title());
        requestBody.put("description",faker.expression("economy factors"));
        requestBody.put("position", faker.number().digit());
        requestBody.put("status", faker.number().digit());
    }



    @Then("The api user prepares a POST request containing {string} {string} {string} and {int} information to send to the api blog add endpoint.")

    public void the_api_user_prepares_a_post_request_containing_image_id_created_by_information_to_send_to_endpoint(String title, String description, String position, int status) {

        requestBody.put("title", title);
        requestBody.put("description",description);
        requestBody.put("position", position);
        requestBody.put("status", status);

    }

    @When("The api user verifies that the data in the response body includes {int}, {string},null, {string}, {string}, {int}, {int} , {string} , {string} , {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_null(int id, String title, String image_id, String description, String position, int status, int created_by, String views, String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "title", equalTo(title),
                        "image_id", equalTo(image_id),
                        "description", equalTo(description),
                        "position", equalTo(position),
                        "status", equalTo(status),
                        "created_by", equalTo(created_by),
                        "views", equalTo(views),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));

    }



}