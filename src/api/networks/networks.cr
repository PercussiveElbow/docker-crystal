module Docker
    struct NetworkList include JSON::Serializable
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

end