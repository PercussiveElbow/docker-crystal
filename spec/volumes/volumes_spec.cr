describe "Volumes endpoint" do


    describe "List Volumes endpoint" do
        list_volumes_response = File.read("spec/resources/volumes/list_volumes.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/volumes").to_return(status: 200, body: list_volumes_response)
        it "should parse list volumes endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.list_volumes()
        end
    end
end