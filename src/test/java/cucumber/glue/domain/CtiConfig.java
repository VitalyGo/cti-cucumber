package cucumber.glue.domain;

import com.google.gson.annotations.SerializedName;

public class CtiConfig {

    @SerializedName("ClusterConfiguration")
    public ClusterConfiguration clusterConfiguration;

    @SerializedName("ServerServiceConfiguration")
    public ServerServiceConfiguration serverServiceConfiguration;

    @SerializedName("SystemQueryServiceConfiguration")
    public SystemQueryServiceConfiguration systemQueryServiceConfiguration;
}
