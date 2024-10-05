package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "pretty",
                "html:target/Cucumber-Reports/HTML_Report_DB.html",
                "json:target/Cucumber-Reports/JSON_Report_DB.json",
                "junit:target/Cucumber-Reports/XML_Reports_DB.xml",
        },
        features = {"src/test/resources/features/DB"},
        glue = {"stepdefinitions"},
        tags = "@DB_US25",
        dryRun = false

)
public class DB_Runner {

}
