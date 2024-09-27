package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.Then;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import utilities.API_Utilities.Authentication;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasItem;

public class packagingStepDefs extends BaseTest {

    String endpoint;
    Response response;
    String requestBody;
    JsonPath resJP;


    @Then("verifies response body where {int} {string} {string} {int} {string} {string} {string}")
    public void verifiesResponseBodyWhere(int id, String name, String price, int status, String position, String created_at, String updated_at) {

        response.then().assertThat().body("data.id", hasItem(id)).
                body("data.name", hasItem(name),
                        "data.price", hasItem(price),
                        "data.status", hasItem(status),
                        "data.position", hasItem(position),
                        "data.created_at", hasItem(created_at),
                        "data.updated_at", hasItem(updated_at));

    }




    @Then("verifies package added")
    public void verifiesPackageAdded() {

        String data = response.jsonPath().getString("data");
        int id = Integer.parseInt(data.replaceAll("\\D",""));

        endpoint="https://qa.agileswiftcargo.com/api/packaging/"+id;


        response = given().when().header("Accept","application/json").header("Authorization","Bearer "+ Authentication.generateToken("admin")).get(endpoint);

        response.then().assertThat().body("id",equalTo(id));

        response.prettyPrint();


    }

    @Then("The api user prepares a POST request containing {string} {string} {int} {string} information to send to the api endpoint.")

    public void theApiUserPreparesAPOSTRequestContainingInformationToSendToTheApiEndpoint(String name, String price, int status, String position) {

        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("price",price)
                .addParameterForMap("status",status)
                .addParameterForMap("position",position)
                .buildUsingMap();


        System.out.println("POST Request Body : " + requestBody);

    }

    @Then("The api user prepares a POST request containing {string} {int} {string} information to send to the api endpoint.")
    public void theApiUserPreparesAPOSTRequestContainingInformationToSendToTheApiEndpoint(String name, int status, String position) {

        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("status",status)
                .addParameterForMap("position",position)
                .buildUsingMap();


        System.out.println("POST Request Body : " + requestBody);

    }


}


