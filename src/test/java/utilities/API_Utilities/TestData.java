package utilities.API_Utilities;

import java.util.HashMap;

public class TestData {
    HashMap<String, HashMap<String, Object>> reqBody = new HashMap<>();

    public HashMap hubRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name", "Test Hub");
        requestBody.put("phone", "01000000004");
        requestBody.put("address", "Houston, Texas");

        return requestBody;
    }

    public HashMap blogRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap deliverymanRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap merchantShopRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap merchantRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("name","Ali" );
        requestBody .put("business_name","PARIS AS" );
        requestBody.put("mobile","123456789" );

        return requestBody;
    }

    public HashMap parcelRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap pickupRequestRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap supportRequestBody() {

        HashMap<String, Object> requestBody = new HashMap<>();

        requestBody.put("", "");

        return requestBody;
    }

    public HashMap requestBody(String folder) {

        reqBody.put("hub", hubRequestBody());

        return reqBody.get(folder);
    }


}
