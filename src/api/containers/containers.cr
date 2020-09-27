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
        property networkSettigs : ContainerListNetworkSettings

        @[JSON::Field(key: "HostConfig")]
        property  : ContainerListHostConfig

        @[JSON::Field(key: "Mounts")]
        property mounts : Array(ContainerListMount)

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

    struct ContainerListNetworkSettings include JSON::Serializable
        @[JSON::Field(key: "Networks")]
        property networks : Hash(String,ContainerListNetworkSettingsNetwork) 
    end

    struct ContainerListNetworkSettingsNetwork include JSON::Serializable
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


    struct ContainerListMount include JSON::Serializable
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
end