package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.Then;

import static org.hamcrest.Matchers.hasItem;

public class packagingStepDefs extends BaseTest {


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


}


