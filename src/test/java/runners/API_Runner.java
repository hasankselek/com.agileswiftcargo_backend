package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "pretty",
                "html:target/default-cucumber-reports.html",
                "json:target/json-reports/cucumber.json",
                "junit:target/xml-report/cucumber.xml",
                
        },
        features = {"src/test/resources/features/API"},
        glue = {"stepdefinitions", "hooks", "utilities"},
        tags = "@d",
        dryRun = false

)
public class API_Runner {
}
