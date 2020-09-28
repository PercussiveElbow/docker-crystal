describe "Volumes endpoint" do
    client = Docker::Client.new("http://127.0.0.1:2375")


    describe "List Volumes endpoint" do
        list_volumes_response = File.read("spec/resources/volumes/list_volumes.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/volumes").to_return(status: 200, body: list_volumes_response)
        it "should parse list volumes endpoint correctly" do 
            client.list_volumes()
        end
    end

    describe "Inspect Volume endpoint" do
        inspect_volume_resource = File.read("spec/resources/volumes/inspect_volume.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/volumes/123").to_return(status: 200, body: inspect_volume_resource)
        it "should parse list volumes endpoint correctly" do 
            client.inspect_volume("123")
        end
    end
end