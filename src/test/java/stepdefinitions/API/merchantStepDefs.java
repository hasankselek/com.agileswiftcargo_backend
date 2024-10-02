package stepdefinitions.API;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import io.cucumber.messages.internal.com.fasterxml.jackson.databind.JsonNode;
import io.cucumber.messages.internal.com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.safari.SafariDriver;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static utilities.API_Utilities.API_Methods.fullPath;
import static utilities.API_Utilities.API_Methods.statusCodeAssert;

public class merchantStepDefs extends BaseTest {

    protected static JsonPath repJP;
    int id;

    static String x;




    Pojo hubAdd;
    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.


    @Given("The api user sends a {string} request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized ALI")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string, String string2) {

        String htpp= string;

        switch (htpp){

            case "GET" :
                response = given()
                        .spec(spec)
                        .when()
                        .get(fullPath);

            case "" :


            case " " :


            default:

        }


        int statusCod= Integer.parseInt(string2);

        statusCodeAssert(statusCod);


        String responseBody = response.getBody().asString();
        JsonPath jsonPath = new JsonPath(responseBody);
        String actualMessage = jsonPath.getString("message");
        Assertions.assertEquals("Unauthenticated.", actualMessage);


    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string} and {string}. ALI")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, int id, int user_id, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {

        JSONObject expectedJsonObject= jsonResponseBodyOlustur(id,user_id,business_name,merchant_unique_id,current_balance,opening_balance,vat);

        JsonPath responseJsonPath= response.jsonPath();

        int actualIndex = dataIndex;

        assertEquals("ID does not match", expectedJsonObject.getInt("id"), responseJsonPath.getInt("[" + actualIndex + "].id"));
        assertEquals("User ID does not match", expectedJsonObject.getInt("user_id"), responseJsonPath.getInt("[" + actualIndex + "].user_id"));
        assertEquals("Business name does not match", expectedJsonObject.getString("business_name"), responseJsonPath.getString("[" + actualIndex + "].business_name"));
        assertEquals("Merchant unique ID does not match", expectedJsonObject.getString("merchant_unique_id"), responseJsonPath.getString("[" + actualIndex + "].merchant_unique_id"));
        assertEquals("Current balance does not match", expectedJsonObject.getString("current_balance"), responseJsonPath.getString("[" + actualIndex + "].current_balance"));
        assertEquals("Opening balance does not match", expectedJsonObject.getString("opening_balance"), responseJsonPath.getString("[" + actualIndex + "].opening_balance"));
        assertEquals("VAT does not match", expectedJsonObject.getString("vat"), responseJsonPath.getString("[" + actualIndex + "].vat"));




    }


    @Given("The api user verifies the information in the response body for the entry with the specified  including {int}, {int}, {string}, {string}, {string}, {string} and {string}. ALI")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_including_and(Integer id, Integer user_id, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {


        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "user_id", equalTo(user_id),
                        "business_name", equalTo(business_name),
                        "merchant_unique_id", equalTo(merchant_unique_id),
                        "current_balance", equalTo(current_balance),
                        "current_balance", equalTo(current_balance),
                        "opening_balance", equalTo(opening_balance),
                        "vat", equalTo(vat));
    }


    @Given("The api user prepares a POST request containing {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string} information to send to the api hubadd endpoint. ALI")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(String name, String business_name, String mobile, String email, String password, String address, String hub_id, String status) {


        requestBody.put("name",name )
                .put("business_name",business_name )
                .put("mobile",mobile )
                .put("email",email )
                .put("password",password )
                .put("address",address )
                .put("hub_id",hub_id )
                .put("status",status );


    }


    @Given("The api user sends a {string} request and saves the returned response ALI")
    public void the_api_user_sends_a_request_and_saves_the_returned_response(String httpMethod) {
        if (requestBody == null || requestBody.length() == 0) {
            API_Methods.sendRequest(httpMethod, null);
        } else {
            API_Methods.sendRequest(httpMethod, requestBody.toString());
        }
    }


    @Given("The api user sets {string} path parameters yeni olusturulan veri idsi ile. ALI")
    public void the_api_user_sets_path_parameters(String pathParam) {

        response.prettyPrint();


        JsonPath jsonPath = new JsonPath(response.asString());

        // ID'yi kaydetme
        id = jsonPath.getInt("data['New Merchant ID']");

        API_Methods.pathParam(pathParam + "/" + id);

    }

    @Given("The api user prepares a patch request to send to the api merchantedit endpoint. ALI")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_merchantedit_endpoint() {

        requestBody.put("name","Ali" );
        requestBody .put("business_name","PARIS France AS" );
        requestBody.put("mobile","123456789" );








    }

    @Given("The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint. ALI")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        repJP = response.jsonPath();
        System.out.println(API_Methods.id);
        System.out.println(repJP.getInt("Merchant.id"));
        Assert.assertEquals(API_Methods.id,repJP.getInt("Merchant.id"));
    }

    @Given("The api user prepares a patch request NON DATA to send to the api merchantedit endpoint. ALI")
    public void the_api_user_prepares_a_patch_requestNONDATA_to_send_to_the_api_merchantedit_endpoint() {

        requestBody.put("","");


    }

    @Given("The api user verifies request to send and saves the returned response.")
    public void the_api_user_verifies_request_to_send_and_saves_the_returned_response() {

        requestBody.put("name","Ali" );
        requestBody .put("business_name","PARIS France AS" );
        requestBody.put("mobile","123456789" );

        x= requestBody.getString("business_name");

        response.then()
                .assertThat()
                .body(

                        "business_name", equalTo(x))
                        ;


    }

    @Given("The api user verifies that the id information in the returned response body is the same as the id delete parameter written in the endpoint. ALI")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_delete_parameter_written_in_the_endpoint() {
        repJP = response.jsonPath();
        System.out.println(API_Methods.id);
        String id= API_Methods.id+"";
        Assert.assertEquals(id,repJP.getString("data.\"Deleted id\""));
    }


    @Given("The api user sets {string} path parameters yeni silinen veri idsi ile. ALI")
    public void the_api_user_sets_path_parameters_yeni_silinen_veri_idsi_ile_ali(String pathParam) {
        response.prettyPrint();


        JsonPath jsonPath = new JsonPath(response.asString());

        // ID'yi kaydetme
        id = Integer.parseInt(jsonPath.getString("data.\"Deleted id\""));

        API_Methods.pathParam(pathParam + "/" + id);
    }





    public static JSONObject jsonResponseBodyOlustur(int id,
                                                     int user_id,
                                                     String business_name,
                                                     String merchant_unique_id,
                                                     String current_balance,
                                                     String opening_balance,
                                                     String vat
                                                     ){

        JSONObject responseBody= new JSONObject();

        responseBody.put("id",id);
        responseBody.put("user_id",user_id);
        responseBody.put("business_name",business_name);
        responseBody.put("merchant_unique_id",merchant_unique_id);
        responseBody.put("current_balance",current_balance);
        responseBody.put("opening_balance","opening_balance");
        responseBody.put("opening_balance",opening_balance);
        responseBody.put("vat",vat);

        return responseBody;
    }



}
