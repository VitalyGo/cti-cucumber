package cucumber.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions( features = "src/test/resources/features", glue = "cucumber.glue", tags = "@Installer" )
public class RunInstallerTest {
    //Run Me!
}
