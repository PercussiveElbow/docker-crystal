module Docker
    struct ContainerList include JSON::Serializable
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "Names")]
        property names : Array(String)
        @[JSON::Field(key: "Image")]
        property image : String
        @[JSON::Field(key: "ImageID")]
        property imageId : String
        @[JSON::Field(key: "Command")]
        property command : String

        @[JSON::Field(key: "Created")]
        property state : Int64

        @[JSON::Field(key: "State")]
        property state : String
        @[JSON::Field(key: "Status")]
        property status : String

        @[JSON::Field(key: "Ports")]
        property state : Array(ContainerListPort)

        @[JSON::Field(key: "Labels")]
        property state : Hash(String,String)

        @[JSON::Field(key: "SizeRw")]
        property sizeRw : Int64?

        
        @[JSON::Field(key: "SizeRootFs")]
        property sizeRootFs : Int64?


        @[JSON::Field(key: "NetworkSettings")]
        property networkSettigs : ContainerNetworkSettings

        @[JSON::Field(key: "HostConfig")]
        property  : ContainerListHostConfig

        @[JSON::Field(key: "Mounts")]
        property mounts : Array(ContainerMount)

    end

    struct ContainerListPort include JSON::Serializable
        @[JSON::Field(key: "PrivatePort")]
        property imageId : Int64
        @[JSON::Field(key: "PublicPortPort")]
        property command : Int64
        @[JSON::Field(key: "Type")]
        property type : String
    end

    struct ContainerListHostConfig include JSON::Serializable
        @[JSON::Field(key: "NetworkMode")]
        property networkMode : String
    end

    struct ContainerNetworkSettings include JSON::Serializable
        @[JSON::Field(key: "Networks")]
        property networks : Hash(String,ContainerNetwork) 
    end

    struct ContainerNetwork include JSON::Serializable
        @[JSON::Field(key: "NetworkID")]
        property networkID : String
        @[JSON::Field(key: "EndpointID")]
        property endpointID : String
        @[JSON::Field(key: "Gateway")]
        property gateway : String
        @[JSON::Field(key: "IPAddress")]
        property ipAddress : String
        @[JSON::Field(key: "IPPrefixLen")]
        property ipPrefixLen : Int64
        @[JSON::Field(key: "IPv6Gateway")]
        property ipv6Gateway : String
        @[JSON::Field(key: "GlobalIPv6Address")]
        property globalIPv6Address : String
        @[JSON::Field(key: "GlobalIPv6PrefixLen")]
        property globalIPv6PrefixLen : Int64
        @[JSON::Field(key: "MacAddress")]
        property macAddress : String
    end

    struct ContainerMount include JSON::Serializable
        @[JSON::Field(key: "Name")]
        property name : String
        @[JSON::Field(key: "Source")]
        property source : String
        @[JSON::Field(key: "Destination")]
        property destination : String
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "Mode")]
        property mode : String
        @[JSON::Field(key: "RW")]
        property rw : Bool
        @[JSON::Field(key: "Propagation")]
        property propagation : String
    end

    struct ContainerInspect include JSON::Serializable
        @[JSON::Field(key: "AppArmorProfile")]
        property appArmorProfile : String
        @[JSON::Field(key: "Args")]
        property args : Array(String)

        # config TODO
        @[JSON::Field(key: "Created")]
        property created : String
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "ExecIDs")]
        property execIDs : Array(String)
        @[JSON::Field(key: "HostConfig")]
        property hostConfig : ContainerInspectHostConfig
        @[JSON::Field(key: "HostnamePath")]
        property hostnamePath : String
        @[JSON::Field(key: "HostsPath")]
        property hostsPath : String
        @[JSON::Field(key: "LogPath")]
        property logPath : String
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "Image")]
        property image : String
        @[JSON::Field(key: "MountLabel")]
        property mountLabel : String
        @[JSON::Field(key: "Name")]
        property name : String
        @[JSON::Field(key: "NetworkSettings")]
        property networkSettings : ContainerNetworkSettings
        @[JSON::Field(key: "Path")]
        property path : String
        @[JSON::Field(key: "ProcessLabel")]
        property processLabel : String
        @[JSON::Field(key: "ResolvConfPath")]
        property resolvConfPath : String
        @[JSON::Field(key: "RestartCount")]
        property restartCount : Int64
        @[JSON::Field(key: "State")]
        property state : ContainerInspectState
        @[JSON::Field(key: "Mounts")]
        property mounts : Array(ContainerMount)
    end

    struct ContainerInspectNetworkSettings include JSON::Serializable
        @[JSON::Field(key: "Bridge")]
        property bridge : String
        @[JSON::Field(key: "SandboxID")]
        property sandboxID : String
        @[JSON::Field(key: "HairpinMode")]
        property hairpinMode : Bool
        @[JSON::Field(key: "LinkLocalIPv6Address")]
        property linkLocalIPv6Address : String
        @[JSON::Field(key: "LinkLocalIPv6PrefixLen")]
        property linkLocalIPv6PrefixLen : Int64
        @[JSON::Field(key: "SandboxKey")]
        property sandboxKey : String
        @[JSON::Field(key: "EndpointID")]
        property endpointID : String
        @[JSON::Field(key: "Gateway")]
        property gateway : String
        @[JSON::Field(key: "GlobalIPv6Address")]
        property globalIPv6Address : String
        @[JSON::Field(key: "GlobalIPv6PrefixLen")]
        property globalIPv6PrefixLen : Int64
        @[JSON::Field(key: "IPAddress")]
        property iPAddress : String
        @[JSON::Field(key: "IPPrefixLen")]
        property iPPrefixLen : Int64
        @[JSON::Field(key: "IPv6Gateway")]
        property iPv6Gateway : String
        @[JSON::Field(key: "MacAddress")]
        property macAddress : String
        @[JSON::Field(key: "Networks")]
        property networks : ContainerNetwork 
    end

    struct ContainerInspectHostConfig include JSON::Serializable
        @[JSON::Field(key: "MaximumIOps")]
        property maximumIOps : Int64
        @[JSON::Field(key: "MaximumIOBps")]
        property maximumIOBps : Int64
        @[JSON::Field(key: "BlkioWeight")]
        property blkioWeight : Int64
        @[JSON::Field(key: "BlkioWeightDevice")]
        property blkioWeightDevice : Array(Hash(String,String))
        @[JSON::Field(key: "BlkioDeviceReadIOps")]
        property blkioDeviceReadIOps : Array(Hash(String,String))
        @[JSON::Field(key: "BlkioDeviceWriteIOps")]
        property blkioDeviceWriteIOps : Array(Hash(String,String))
        @[JSON::Field(key: "ContainerIDFile")]
        property containerIDFile : String
        @[JSON::Field(key: "CpusetCpus")]
        property cpusetCpus : String
        @[JSON::Field(key: "CpusetMems")]
        property cpusetMems : String
        @[JSON::Field(key: "CpuPercent")]
        property cpuPercent : Int64
        @[JSON::Field(key: "CpuShares")]
        property cpuShares : Int64
        @[JSON::Field(key: "CpuPeriod")]
        property cpuPeriod : Int64
        @[JSON::Field(key: "CpuRealtimePeriod")]
        property cpuRealtimePeriod : Int64
        @[JSON::Field(key: "CpuRealtimeRuntime")]
        property cpuRealtimeRuntime : Int64
        @[JSON::Field(key: "Devices")]
        property devices : Array(String)
        @[JSON::Field(key: "DeviceRequests")]
        property deviceRequests : Array(ContainerInspectHostConfigDeviceRequest)
        @[JSON::Field(key: "IpcMode")]
        property ipcMode : String
        @[JSON::Field(key: "LxcConf")]
        property lxcConf : Array(String)
        @[JSON::Field(key: "Memory")]
        property memory : Int64
        @[JSON::Field(key: "MemorySwap")]
        property memorySwap : Int64
        @[JSON::Field(key: "MemoryReservation")]
        property memoryReservation : Int64
        @[JSON::Field(key: "KernelMemory")]
        property kernelMemory : Int64
        @[JSON::Field(key: "OomKillDisable")]
        property oomKillDisable : Bool
        @[JSON::Field(key: "OomScoreAdj")]
        property oomScoreAdj : Int64
        @[JSON::Field(key: "NetworkMode")]
        property networkMode : String
        @[JSON::Field(key: "PidMode")]
        property pidMode : String 
        @[JSON::Field(key: "PortBindings")]
        property portBindings : Hash(String,String)  
        @[JSON::Field(key: "Privileged")]
        property privileged : Bool
        @[JSON::Field(key: "ReadonlyRootfs")]
        property readonlyRootfs : Bool 
        @[JSON::Field(key: "PublishAllPorts")]
        property publishAllPorts : Bool
        @[JSON::Field(key: "RestartPolicy")]
        property restartPolicy : ContainerInspectHostConfigRestartPolicy
        @[JSON::Field(key: "LogConfig")]
        property logConfig : ContainerInspectHostConfigLogConfig
        @[JSON::Field(key: "Sysctls")]
        property sysctls : ContainerInspectHostConfigSysctls
        @[JSON::Field(key: "Ulimits")]
        property ulimits : Array(Hash(String,String))
        @[JSON::Field(key: "VolumeDriver")]
        property volumeDriver : String
        @[JSON::Field(key: "ShmSize")]
        property shmSize : Int64
    end

    struct ContainerInspectHostConfigDeviceRequest include JSON::Serializable # any longer variable names and I'll be writing Java
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "Count")]
        property count : Float64
        # @[JSON::Field(key: "DeviceIDs\"")] # sample has " in field name?
        # property deviceIDs : Array(String)
        @[JSON::Field(key: "Capabilities")]
        property capabilities : Array(Array(String))
        @[JSON::Field(key: "Options")]
        property options : Hash(String,String)
    end

    struct ContainerInspectHostConfigRestartPolicy include JSON::Serializable
        @[JSON::Field(key: "MaximumRetryCount")]
        property maximumRetryCount : Int64
        @[JSON::Field(key: "Name")]
        property name : String
    end

    struct ContainerInspectHostConfigLogConfig include JSON::Serializable
        @[JSON::Field(key: "Type")]
        property type : String
    end

    struct ContainerInspectHostConfigSysctls include JSON::Serializable 
        @[JSON::Field(key: "net.ipv4.ip_forward")]
        property net_ipv4_ip_forward : String
    end

    struct ContainerInspectState include JSON::Serializable
        @[JSON::Field(key: "Error")]
        property error : String
        @[JSON::Field(key: "ExitCode")]
        property exitCode : Int64
        @[JSON::Field(key: "FinishedAt")]
        property finishedAT : String
    end


    struct ContainerInspectStateHealth include JSON::Serializable
        @[JSON::Field(key: "Status")]
        property status : String
        @[JSON::Field(key: "FailingStreak")]
        property exitCode : Int64
        @[JSON::Field(key: "Log")]
        property log : Array(ContainerInspectStateHealthLog)
        @[JSON::Field(key: "OOMKilled")]
        property oomKilled : Bool
        @[JSON::Field(key: "Dead")]
        property dead : Bool 
        @[JSON::Field(key: "Paused")]
        property paused : Bool
        @[JSON::Field(key: "Pid")]
        property pid : Int64 
        @[JSON::Field(key: "Restarting")]
        property restarting : Bool
        @[JSON::Field(key: "Running")]
        property running : Bool
        @[JSON::Field(key: "StartedAt")]
        property startedAt : String
        @[JSON::Field(key: "Status")]
        property status : String
    end

    struct ContainerInspectStateHealthLog include JSON::Serializable
        @[JSON::Field(key: "Start")]
        property logStart : String
        @[JSON::Field(key: "End")]
        property logEnd : String
        @[JSON::Field(key: "ExitCode")]
        property exitCode : Int64
        @[JSON::Field(key: "Output")]
        property output : String
    end

    struct ContainerFilesystemChange include JSON::Serializable
        @[JSON::Field(key: "Path")]
        property path : String
        @[JSON::Field(key: "Kind")]
        property kind : Int64
    end

    struct ContainerProcesses include JSON::Serializable
        @[JSON::Field(key: "Titles")]
        property titles : Array(String)
        @[JSON::Field(key: "Processes")]
        property processes : Array(Array(String))
    end

end