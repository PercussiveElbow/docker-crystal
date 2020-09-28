module Docker 
    struct ExecInspect include JSON::Serializable
        @[JSON::Field(key: "CanRemove")]
        property canRemove : Bool
        @[JSON::Field(key: "ContainerID")]
        property containerID : String
        @[JSON::Field(key: "DetachKeys")]
        property detachKeys : String
        @[JSON::Field(key: "ExitCode")]
        property exitCode : Int64
        @[JSON::Field(key: "ID")]
        property id : String
        @[JSON::Field(key: "OpenStderr")]
        property openStderr : Bool
        @[JSON::Field(key: "OpenStdout")]
        property openStdout : Bool
        @[JSON::Field(key: "OpenStdin")]
        property openStdin : Bool
        @[JSON::Field(key: "Running")]
        property running : Bool
        @[JSON::Field(key: "Pid")]
        property pid : Int64
        @[JSON::Field(key: "ProcessConfig")]
        property processConfig : ExecInspectProcessConfig
    end

    struct ExecInspectProcessConfig include JSON::Serializable
        @[JSON::Field(key: "arguments")]
        property arguments : Array(String)
        @[JSON::Field(key: "entrypoint")]
        property entrypoint : String
        @[JSON::Field(key: "privileged")]
        property privileged : Bool
        @[JSON::Field(key: "tty")]
        property tty : Bool
        @[JSON::Field(key: "user")]
        property user : String
    end
end
