module Docker
    struct Network include JSON::Serializable
        @[JSON::Field(key: "Name")]
        property name : String
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "Created")]
        property created : String
        @[JSON::Field(key: "Scope")]
        property scope : String
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "EnableIPv6")]
        property enableIPv6 : Bool
        @[JSON::Field(key: "Internal")]
        property internal : Bool
        @[JSON::Field(key: "Attachable")]
        property attachable : Bool
        @[JSON::Field(key: "Ingress")]
        property ingress : Bool
        @[JSON::Field(key: "IPAM")]
        property attachable : NetworkListIPAM
        @[JSON::Field(key: "Options")]
        property options : Hash(String,String)
        @[JSON::Field(key: "Containers")]
        property containers : Hash(String,NetworkContainer)?
    end

    struct NetworkListIPAM include JSON::Serializable
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "Config")]
        property config : Array(NetworkListIPAMConfig)
    end
    struct NetworkListIPAMConfig include JSON::Serializable
        @[JSON::Field(key: "Subnet")]
        property subnet : String
    end

    struct NetworkContainer include JSON::Serializable
        @[JSON::Field(key: "Name")]
        property name : String
        @[JSON::Field(key: "EndpointID")]
        property endpointID : String
        @[JSON::Field(key: "MacAddress")]
        property macAddress : String
        @[JSON::Field(key: "IPv4Address")]
        property ipv4Address : String
        @[JSON::Field(key: "IPv6Address")]
        property ipv6address : String
    end
end