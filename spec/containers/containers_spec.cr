describe "Containers endpoint" do


    describe "List Containers endpoint" do
        containers_list_response = File.read("spec/resources/containers/list_containers.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/json?all=false&size=false").to_return(status: 200, body: containers_list_response)
        it "should parse list containers endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.list_containers()
        end
    end

    describe "Inspect Containers endpoint" do
        container_inspect_response = File.read("spec/resources/containers/inspect_container.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/containers/123/json").to_return(status: 200, body: container_inspect_response)
        it "should parse inspect containers endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.inspect_container("123")
        end
    end
end