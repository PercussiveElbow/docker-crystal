describe "Networks endpoint" do
    client = Docker::Client.new("http://127.0.0.1:2375")


    describe "List Networks endpoint" do
        networks_list_response = File.read("spec/resources/networks/list_networks.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/networks").to_return(status: 200, body: networks_list_response)
        it "should parse list networks endpoint correctly" do 
            client.list_networks()
        end
    end


    describe "Inspect Network endpoint" do
        networks_inspect_response = File.read("spec/resources/networks/inspect_network.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/networks/123").to_return(status: 200, body: networks_inspect_response)
        it "should parse inspect networks endpoint correctly" do 
            client.inspect_network("123")
        end
    end
end