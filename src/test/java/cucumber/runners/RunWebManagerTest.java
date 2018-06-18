package cucumber.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions( features = "src/test/resources/features/web", glue = "cucumber.glue" )
public class RunWebManagerTest {
    //Run Me!
}
