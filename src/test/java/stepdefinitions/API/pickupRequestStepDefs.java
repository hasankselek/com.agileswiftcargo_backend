package stepdefinitions.API;

import base.BaseTest;
import io.cucumber.java.en.*;
import org.apache.http.client.entity.DeflateInputStream;
import utilities.API_Utilities.API_Methods;

import java.util.List;

import static org.junit.Assert.*;

public class pickupRequestStepDefs extends BaseTest {


    // ************************************************ api/pickuprequest/list(regular-express) ******************************************************
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataindex, int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {

        repJP = response.jsonPath();

        assertEquals(id, repJP.getInt("[" + dataindex + "].id"));

        //request type null control
        if ("null".equals(request_type)) {
            assertNull(repJP.getString("[" + dataindex + "].request_type"));
        }
        else {
            assertEquals(request_type,repJP.getString("[" + dataindex + "].request_type"));
        }

        //merchant id
        assertEquals(merchant_id, repJP.getInt("[" + dataindex + "].merchant_id"));

        //address null control
        if ("null".equals(address)) {
            assertNull(repJP.getString("[" + dataindex + "].address"));
        }
        else {
            assertEquals(address,repJP.getString("[" + dataindex + "].address" ));
        }

        //name null control
        if ("null".equals(name)) {
            assertNull(repJP.getString("[" + dataindex + "].name"));
        }
        else {
            assertEquals(name,repJP.getString("[" + dataindex + "].name" ));
        }

        // note null control
        if ("null".equals(note)) {
            assertNull(repJP.getString("[" + dataindex + "].note"));
        }
        else {
            assertEquals(note,repJP.getString("[" + dataindex + "].note" ));
        }

        //parcel quantity
        assertEquals(parcel_quantity, repJP.getInt("[" + dataindex + "].parcel_quantity"));

        // phone null control
        if ("null".equals(phone)) {
            assertNull(repJP.getString("[" + dataindex + "].phone"));
        }
        else {
            assertEquals(phone,repJP.getString("[" + dataindex + "].phone" ));
        }

        // cod_amount null control
        if ("null".equals(cod_amount)) {
            assertNull(repJP.getString("[" + dataindex + "].cod_amount"));
        }
        else {
            assertEquals(cod_amount,repJP.getString("[" + dataindex + "].cod_amount" ));
        }

        // invoice null control
        if ("null".equals(invoice)) {
            assertNull(repJP.getString("[" + dataindex + "].invoice"));
        }
        else {
            assertEquals(invoice,repJP.getString("[" + dataindex + "].invoice" ));
        }

        //weight
        assertEquals(weight, repJP.getInt("[" + dataindex + "].weight"));

        //exchange
        assertEquals(exchange, repJP.getInt("[" + dataindex + "].exchange"));

        // created_at null control
        if ("null".equals(created_at)) {
            assertNull(repJP.getString("[" + dataindex + "].created_at"));
        }
        else {
            assertEquals(created_at,repJP.getString("[" + dataindex + "].created_at" ));
        }

        // updated_at null control
        if ("null".equals(updated_at)) {
            assertNull(repJP.getString("[" + dataindex + "].updated_at"));
        }
        else {
            assertEquals(updated_at,repJP.getString("[" + dataindex + "].updated_at" ));
        }




    }

    @Given("The api user verifies that the data in the response body includes {int}, {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {
        API_Methods.assertBodyMatchers("id",id);
        API_Methods.assertBodyMatchers("request_type",request_type);
        API_Methods.assertBodyMatchers("merchant_id",merchant_id);
        API_Methods.assertBodyMatchers("address",address);
        API_Methods.assertBodyMatchers("note",note);
        API_Methods.assertBodyMatchers("parcel_quantity",parcel_quantity);
        API_Methods.assertBodyMatchers("name",name);
        API_Methods.assertBodyMatchers("phone",phone);
        API_Methods.assertBodyMatchers("cod_amount",cod_amount);
        API_Methods.assertBodyMatchers("weight",weight);
        API_Methods.assertBodyMatchers("exchange",exchange);
        API_Methods.assertBodyMatchers("created_at",created_at);
        API_Methods.assertBodyMatchers("updated_at",updated_at);

    }
}



