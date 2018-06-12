package cucumber.glue.domain;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ClusterConfiguration {

    public String Name;
    public int Delay;
    public boolean RL;
    public String SSDir;
    public String SSLog;
    public String SQDir;
    public String SQLog;

    @SerializedName("Hosts")
    public List<Hosts> hosts;
}
