package cucumber.glue;

import com.google.gson.Gson;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.glue.domain.installer.InstallerEntity;
import cucumber.glue.domain.installer.InstallerInfo;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.Assert;

import java.io.File;
import java.util.Arrays;
import java.util.List;

public class InstallerStepDefs {

    String installerDirectory;
    List<InstallerEntity> expectedInstallerEntities;

    @Given("^install directory \"([^\"]*)\"$")
    public void install_directory(String directory) throws Throwable {

        installerDirectory = directory;
    }

    @Given("^install items$")
    public void install_directories(String directories) throws Throwable {

        expectedInstallerEntities = Arrays.asList( new Gson().fromJson(directories, InstallerEntity[].class));

        for(InstallerEntity entity:expectedInstallerEntities)
        {
            entity.Location = String.join(File.separator, installerDirectory, entity.Location);
        }
    }

    @Then("^validate files$")
    public void validate_files() throws Throwable {

        String url = "http://AUT-INST-CL1/remote/api/install";

        Response response = RestAssured.given().contentType(ContentType.JSON).body(expectedInstallerEntities).post(url);

        InstallerInfo installerInfo = response.body().as(InstallerInfo.class);

        Assert.assertEquals(installerInfo.message,"pass", installerInfo.status);


    }

    @Then("^validate directories$")
    public void validate_directories() throws Throwable {

    }

    @Then("^validate registry settings$")
    public void validate_registry_settings(String arg1) throws Throwable {

    }

}
