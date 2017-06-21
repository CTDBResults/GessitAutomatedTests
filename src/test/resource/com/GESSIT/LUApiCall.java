package com.GESSIT;
import org.junit.Test;
import com.jayway.restassured.response.Response;
import static com.jayway.restassured.RestAssured.given;

import java.util.regex.Pattern;
public class LUApiCall {

	
	int id;
	String site_type;
	String evidence_grade;
	String summary;
	String description;
	int primary_drug_id;
	int co_drug_id;
	int interaction_status;
@Test
public void myTest()
{
//expect().body("title", equalTo("Google")).when().get("http://google.com");
//given().when().get("http://www.hep-druginteractions.org/api/hep_interactions").then().statusCode(200);
given().header("X-API-Key","d8b0ce17359d2290caf6754c58281f8c").when().get("http://www.hep-druginteractions.org/api/hep_interactions").then().statusCode(200);
Response response = given().header("X-API-Key","d8b0ce17359d2290caf6754c58281f8c")
.when()
.get ("http://www.hep-druginteractions.org/api/hep_interactions").then().
extract().response();
System.out.println(response);
String responseBody = response.getBody().asString();
System.out.println(responseBody);



// test




}

}
