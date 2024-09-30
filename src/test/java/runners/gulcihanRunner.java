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
                "rerun:target/failedRerun.txt"
        },
        features = {"src/test/resources/features/API", "src/test/resources/features/DB"},
        glue = {"stepdefinitions","hooks","utilities"},
        tags = "@API_TC5301",
        dryRun =false



)
public class gulcihanRunner {
}
