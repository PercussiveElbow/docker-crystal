module Docker
    struct VolumeList include JSON::Serializable
        @[JSON::Field(key: "Volumes")]
        property volumes : Array(VolumeListVolume)
        @[JSON::Field(key: "Warnings")]
        property volumes : Array(String)?
    end

    struct VolumeListVolume include JSON::Serializable
        @[JSON::Field(key: "CreatedAt")]
        property createdAt : String
        @[JSON::Field(key: "Name")]
        property name : String
        @[JSON::Field(key: "Driver")]
        property driver : String
        @[JSON::Field(key: "Mountpoint")]
        property mountPoint : String
        @[JSON::Field(key: "Labels")]
        property labels : Hash(String,String)
        @[JSON::Field(key: "Scope")]
        property scope : String
        @[JSON::Field(key: "Options")]
        property createdAt : String
    end

    struct VolumeListVolume include JSON::Serializable
        @[JSON::Field(key: "device")]
        property device : String
        @[JSON::Field(key: "o")]
        property o : String
        @[JSON::Field(key: "type")]
        property type : String
    end

end