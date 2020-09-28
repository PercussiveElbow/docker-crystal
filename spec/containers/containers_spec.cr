describe "Containers endpoint" do
    client = Docker::Client.new("http://127.0.0.1:2375")


    describe "List Containers endpoint" do
        containers_list_response = File.read("spec/resources/containers/list_containers.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/json?all=false&size=false").to_return(status: 200, body: containers_list_response)
        it "should parse list containers endpoint correctly" do 
            client.list_containers()
        end
    end

    describe "Inspect Containers endpoint" do
        container_inspect_response = File.read("spec/resources/containers/inspect_container.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/123/json").to_return(status: 200, body: container_inspect_response)
        it "should parse inspect containers endpoint correctly" do 
            client.inspect_container("123")
        end
    end

    describe "Container filesystem history endpoint" do
        container_filesystem_changes_response = File.read("spec/resources/containers/container_filesystem_changes.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/123/changes").to_return(status: 200, body: container_filesystem_changes_response)
        it "should parse inspect containers endpoint correctly" do 
            client.container_filesystem_changes("123")
        end
    end

    describe "Container processes  endpoint" do
        container_processes_response = File.read("spec/resources/containers/list_container_processes.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/123/top").to_return(status: 200, body: container_processes_response)
        it "should parse container processes endpoint correctly" do 
            client.container_processes("123")
        end
    end
end