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

    struct ImageInspect include JSON::Serializable
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "Container")]
        property container : String
        @[JSON::Field(key: "Comment")]
        property comment : String
        @[JSON::Field(key: "Os")]
        property os : String
        @[JSON::Field(key: "Architecture")]
        property architecture : String
        @[JSON::Field(key: "Parent")]
        property parent : String

        # container config
        @[JSON::Field(key: "ContainerConfig")]
        property containerConfig : ImageInspectConfig

        @[JSON::Field(key: "DockerVersion")]
        property dockerVersion : String
        @[JSON::Field(key: "VirtualSize")]
        property virtualSize : Int64
        @[JSON::Field(key: "Size")]
        property size : Int64
        @[JSON::Field(key: "Author")]
        property author : String
        @[JSON::Field(key: "Created")]
        property created : String

        @[JSON::Field(key: "RepoDigests")]
        property repoDigests : Array(String)
        @[JSON::Field(key: "RepoTags")]
        property repoDigests : Array(String)

        @[JSON::Field(key: "RootFS")]
        property rootFS : InspectImageRootFS
    end

    struct ImageInspectConfig include JSON::Serializable
        @[JSON::Field(key: "Image")]
        property image : String
        @[JSON::Field(key: "NetworkDisabled")]
        property networkDisabled : Bool
        @[JSON::Field(key: "OnBuild")]
        property onBuild : Array(String)
        @[JSON::Field(key: "StdinOnce")]
        property stdInOnce : Bool
        @[JSON::Field(key: "PublishService")]
        property publishService : String
        @[JSON::Field(key: "AttachStdin")]
        property attachStdin : Bool
        @[JSON::Field(key: "OpenStdin")]
        property openStdin : Bool
        @[JSON::Field(key: "Domainname")]
        property domainName : String
        @[JSON::Field(key: "AttachStdout")]
        property attachStdout : Bool
        @[JSON::Field(key: "Tty")]
        property tty : Bool
        @[JSON::Field(key: "Hostname")]
        property hostname : String
        @[JSON::Field(key: "Cmd")]
        property cmd : Array(String)
        @[JSON::Field(key: "Env")]
        property env : Array(String)
        @[JSON::Field(key: "Labels")]
        property labels : Hash(String,String)
        @[JSON::Field(key: "MacAddress")]
        property macAddress : String
        @[JSON::Field(key: "AttachStderr")]
        property attachStderr : Bool
        @[JSON::Field(key: "WorkingDir")]
        property workingDir : String
        @[JSON::Field(key: "User")]
        property user : String
    end

    struct InspectImageRootFS include JSON::Serializable
        @[JSON::Field(key: "Type")]
        property type : String
        @[JSON::Field(key: "Layers")]
        property layers : Array(String)
    end

    struct ImageHistory include JSON::Serializable
        @[JSON::Field(key: "Id")]
        property id : String
        @[JSON::Field(key: "Created")]
        property created : Int64
        @[JSON::Field(key: "CreatedBy")]
        property createdBy : String
        @[JSON::Field(key: "Tags")]
        property user : Array(String)
        @[JSON::Field(key: "Size")]
        property size : Int64
        @[JSON::Field(key: "Comment")]
        property comment : String
    end
end