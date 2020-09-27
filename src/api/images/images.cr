module Docker
    struct ImageList include JSON::Serializable
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "ParentId")]
        property parentId : String 
        @[JSON::Field(key: "RepoTags")]
        property repoTags : Array(String)?
        @[JSON::Field(key: "RepoDigests")]
        property repoDigests : Array(String)?
        @[JSON::Field(key: "Created")]
        property created :  Int64
        @[JSON::Field(key: "Size")]
        property size : Int64
        @[JSON::Field(key: "VirtualSize")]
        property virtualSize :  Int64
        @[JSON::Field(key: "SharedSize")]
        property sharedSize : Int64

        # labels

        @[JSON::Field(key: "Containers")]
        property containers :  Int64
    end
end