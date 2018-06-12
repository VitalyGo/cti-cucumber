package cucumber.glue;

import com.google.gson.Gson;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.glue.domain.CtiConfig;
import cucumber.glue.domain.CtiQueryFile;
import cucumber.glue.domain.CtiServerFile;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import org.junit.Assert;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class StepDefs {

    private static final Logger logger = LogManager.getLogger(StepDefs.class);

    private String requestJson;
    private CtiConfig expectedCtiConfig;
    private RegistryInfo expectedRegistryInfo = new RegistryInfo();

    @Given("^cti config$")
    public void cti_config(String json) throws Throwable {

        Random r = new Random();
        requestJson = json;

        if(json.contains("[LMC_IP]"))
        {
            String lmc_address = r.nextInt(256) + "." + r.nextInt(256) + "." + r.nextInt(256) + "." + r.nextInt(256);
            requestJson = requestJson.replace("[LMC_IP]", lmc_address);
            expectedRegistryInfo.address = lmc_address;
        }

        if(json.contains("[LMC_Port]"))
        {
            String lmc_port = String.valueOf(r.nextInt(99999));
            requestJson = requestJson.replace("[LMC_Port]", lmc_port);
            expectedRegistryInfo.port = lmc_port;
        }

        Gson gson = new Gson();

        expectedCtiConfig = gson.fromJson(requestJson, CtiConfig.class);

    }

    @Given("^reset \"([^\"]*)\" config$")
    public void reset_config(String file) throws Throwable {

        String url = "http://aut-ctisrv2/remote/api/file/" + file;

        RestAssured.delete(url);
    }

    @When("^send cti config$")
    public void send_cti_config() throws Throwable {

        String url = "http://aut-ctisrv2/SpokCTIWebManager/api/CTIConfig";
        Response response = RestAssured.given().contentType(ContentType.JSON).body(requestJson).post(url);
        Assert.assertTrue(response.asString().contains("true"));

    }

    @Then("^validate \"([^\"]*)\" is \"([^\"]*)\"$")
    public void validate_ServiceState(String service, String state) throws Throwable {

        String url = "http://aut-ctisrv2/remote/api/services/";
        List<String> stateList = Arrays.asList("stopped", "startPending", "stopPending", "running", "continuePending", "pausePending", "paused" );

        ServiceInfo expectedServiceInfo = new ServiceInfo();
        expectedServiceInfo.name = service;
        expectedServiceInfo.state = state;
        expectedServiceInfo.message = "";

        Assert.assertTrue(stateList.contains(state.toLowerCase()));

        Response response = RestAssured.given().contentType(ContentType.JSON).body(expectedServiceInfo).post(url);

        ServiceInfo actualServiceInfo = response.body().as(ServiceInfo.class);

        Assert.assertFalse(actualServiceInfo.message, actualServiceInfo.message.length() > 0);
        Assert.assertEquals(expectedServiceInfo.state, actualServiceInfo.state);
    }

    @Then("^validate LMC registry address and port")
    public void validate_LMC_registry_address_and_port() throws Throwable {

        String url = "http://aut-ctisrv2/remote/api/registry/";

        Response response = RestAssured.given().contentType(ContentType.JSON).get(url);
        RegistryInfo actualRegistryInfo = response.body().as(RegistryInfo.class);

        Assert.assertFalse(actualRegistryInfo.message, actualRegistryInfo.message.length() > 0);
        Assert.assertEquals(expectedRegistryInfo.address, actualRegistryInfo.address);
        Assert.assertEquals(expectedRegistryInfo.port, actualRegistryInfo.port);
    }

    @Then("^validate \"([^\"]*)\" config$")
    public void validate_config(String config) throws Throwable {

        String url = "http://aut-ctisrv2/remote/api/file";
        FileInfo fileInfo = new FileInfo();
        Gson gson = new Gson();

        if(config.equalsIgnoreCase("cti-server"))
        {
            fileInfo.name = "cti-server";

            Response response = RestAssured.given().contentType(ContentType.JSON).body(fileInfo).when().post(url);

            CtiServerFile ctiServerFile = gson.fromJson(response.body().asString(), CtiServerFile.class);

            Assert.assertEquals(expectedCtiConfig.serverServiceConfiguration.IP, ctiServerFile.phoneServerIP);
            Assert.assertEquals(expectedCtiConfig.serverServiceConfiguration.Port, ctiServerFile.phoneServerPort);
            Assert.assertEquals(expectedCtiConfig.serverServiceConfiguration.Timeout, ctiServerFile.timeOut);
            Assert.assertEquals(expectedCtiConfig.serverServiceConfiguration.Type, ctiServerFile.integration);
            Assert.assertEquals(expectedCtiConfig.serverServiceConfiguration.Connect, ctiServerFile.connectionFlag);
            Assert.assertEquals(expectedCtiConfig.clusterConfiguration.SSDir, ctiServerFile.logPath);
            Assert.assertEquals(expectedCtiConfig.clusterConfiguration.SSLog, ctiServerFile.logName);

        }
        else if(config.equalsIgnoreCase("query"))
        {
            fileInfo.name = "query";

            Response response = RestAssured.given().contentType(ContentType.JSON).body(fileInfo).when().post(url);

            CtiQueryFile ctiQueryFile = gson.fromJson(response.body().asString(), CtiQueryFile.class);

            Assert.assertEquals(expectedCtiConfig.systemQueryServiceConfiguration.LBIP, ctiQueryFile.serverIP);
            Assert.assertEquals(expectedCtiConfig.systemQueryServiceConfiguration.Port, ctiQueryFile.serverPort);
            Assert.assertEquals(expectedCtiConfig.systemQueryServiceConfiguration.Interval, ctiQueryFile.acdQueuePollInterval);
            Assert.assertEquals(expectedCtiConfig.systemQueryServiceConfiguration.Type, ctiQueryFile.connectionType);
            Assert.assertEquals(expectedCtiConfig.systemQueryServiceConfiguration.Queue, ctiQueryFile.monitorACDQueueList);
            Assert.assertEquals(expectedCtiConfig.clusterConfiguration.SQDir, ctiQueryFile.logPath);
            Assert.assertEquals(expectedCtiConfig.clusterConfiguration.SQLog, ctiQueryFile.logName);
        }
        else if(config.equalsIgnoreCase("consul"))
        {
            fileInfo.name = "consul";

            Response response = RestAssured.given().contentType(ContentType.JSON).body(fileInfo).when().post(url);

            ConsulFile actualConsulFile = response.body().as(ConsulFile.class);

            Assert.assertEquals("10.50.129.243", actualConsulFile.bind_addr);
            Assert.assertEquals(1, actualConsulFile.bootstrap_expect);
            Assert.assertEquals("Spok-Careconnect-CTI", actualConsulFile.datacenter);
            Assert.assertEquals("INFO", actualConsulFile.log_level);
            Assert.assertTrue(actualConsulFile.server);
            Assert.assertEquals(1, actualConsulFile.retry_join.size());
            Assert.assertEquals("aut-ctisrv2", actualConsulFile.retry_join.get(0).toLowerCase());

        }
    }
}
