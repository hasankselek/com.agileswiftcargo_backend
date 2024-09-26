package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.*;
import org.apache.http.client.entity.DeflateInputStream;
import utilities.API_Utilities.API_Methods;

import java.util.List;

import static org.junit.Assert.*;

public class pickupRequestStepDefs extends BaseTest {

    int expectedID;

    // ************************************************ api/pickuprequest/list(regular-express) ******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {

        repJP = response.jsonPath();
        expectedID = id;

        int size = repJP.getList("").size();

        for (int i = 0; i < size; i++) {

            if (expectedID == repJP.getInt("[" + i + "].id")) {

                if ("null".equals(request_type)) {
                    assertNull(repJP.getString("[" + i + "].request_type"));
                }
                else {
                    assertEquals(request_type,repJP.getString("[" + i + "].request_type"));
                }

                if ("null".equals(name)) {
                    assertNull(repJP.getString("[" + i + "].name"));
                }
                else {
                    assertEquals(name,repJP.getString("[" + i + "].name" ));
                }


            }


        }

    }

}



