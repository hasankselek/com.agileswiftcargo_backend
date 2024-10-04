package stepdefinitions.DB;

import Manage.Manage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import utilities.DB_Utilities.JDBCMethods;

import java.sql.SQLException;

import static HelperDB.JDBC_Structure_Methods.*;
import static org.junit.Assert.assertEquals;

public class GG_StepDefs extends Manage {

    String expectedPartner = "Alibaba";
    String expectedPriority= "highest";
    int expectedSalary = 10000;
    int intResult;



    /**
     * US24
     **/

    @Given("Query prepared partners table")
    public void prepare_the_query24() throws SQLException {

        query = getPartners();
        resultSet = getStatement().executeQuery(query);



    }
    @Given("Processes the results of the partners table query")
    public void processes_the_results_of_the_query() throws SQLException {
        resultSet.next();
        String actualPartner = resultSet.getString("name");

        assertEquals(expectedPartner,actualPartner);
        System.err.println("Expected Partner Name = " + expectedPartner + "\n" + "Actual Partner Name = " + actualPartner);




    }



    /**
     * US25
     **/

    @Then("Query prepared salary_generates table")
    public void queryPreparedSalary_generatesTable()  {

        query = getSalary_generates();
        intResult = JDBCMethods.updateQuery(query);

    }

    @When("Verify that {int} row updated to the table")
    public void Verifythatrowupdatedtothetable(int row) {

      assertEquals(row,intResult);


    }


    @And("Verify amount is update")
    public void verifyAmountIsUpdate() throws SQLException {

        query = getControlQuery_salary();
        resultSet=getStatement().executeQuery(query);
        resultSet.next();
        int actualSalary = resultSet.getInt("amount");

        assertEquals(expectedSalary,actualSalary);
        System.err.println("Expected Salary = " + expectedSalary + "\n" + "Actual Salary = " + actualSalary);





    }


    /**
     * US27
     **/


    @And("Query prepared supports table")
    public void queryPreparedSupportsTable() {

        query = getSupports();
        intResult = JDBCMethods.updateQuery(query);


    }

    @Then("Verify priority is update")
    public void verifyPriorityIsUpdate() throws SQLException {

        query = getControlQuery_supports();
        resultSet=getStatement().executeQuery(query);
        resultSet.next();
        String actualPriority = resultSet.getString("priority");

        assertEquals(expectedPriority,actualPriority);
        System.err.println("Expected Priority = " + expectedPriority + "\n" + "Actual Priority = " + actualPriority);




    }
}
