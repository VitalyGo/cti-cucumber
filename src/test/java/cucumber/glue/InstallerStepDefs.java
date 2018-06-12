package cucumber.glue;

import com.google.gson.Gson;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.glue.domain.InstallerEntity;

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

    @Given("^install files$")
    public void install_files(String files) throws Throwable {

        expectedInstallerEntities = Arrays.asList( new Gson().fromJson(files, InstallerEntity[].class));

    }

    @Given("^install directories$")
    public void install_directories(String directories) throws Throwable {

        expectedInstallerEntities = Arrays.asList( new Gson().fromJson(directories, InstallerEntity[].class));
        System.out.print("Size: " + expectedInstallerEntities.size());

        for(InstallerEntity entity:expectedInstallerEntities)
        {
            entity.Location = String.join(File.separator, installerDirectory, entity.Location);
            System.out.print(entity.Location);
            System.out.print(System.lineSeparator());
        }
    }

    @Then("^validate files$")
    public void validate_files() throws Throwable {

    }

    @Then("^validate directories$")
    public void validate_directories() throws Throwable {

    }

    @Then("^validate registry settings$")
    public void validate_registry_settings(String arg1) throws Throwable {

    }

}
