package cucumber.glue;

public enum ServiceControllerStatus {

    Stopped,
    StartPending,
    StopPending,
    Running,
    ContinuePending,
    PausePending,
    Paused;
}
