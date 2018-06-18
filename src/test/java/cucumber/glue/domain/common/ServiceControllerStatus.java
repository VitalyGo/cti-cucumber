package cucumber.glue.domain.common;

public enum ServiceControllerStatus {

    Stopped,
    StartPending,
    StopPending,
    Running,
    ContinuePending,
    PausePending,
    Paused;
}
