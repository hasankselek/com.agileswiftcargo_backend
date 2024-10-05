package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "pretty",
                "html:target/Cucumber-Reports/HTML_Report_API.html",
                "json:target/Cucumber-Reports/JSON_Report_API.json",
                "junit:target/Cucumber-Reports/XML_Reports_API.xml",
                
        },
        features = {"src/test/resources/features/API"},
        glue = {"stepdefinitions", "hooks", "utilities"},
        //tags = "@E2E",
        dryRun = false

)
public class API_Runner {
}
