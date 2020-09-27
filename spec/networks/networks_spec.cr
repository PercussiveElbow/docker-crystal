describe "Networks endpoint" do


    describe "List Networks endpoint" do
        networks_list_response = File.read("spec/resources/list_networks.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/networks").to_return(status: 200, body: networks_list_response)
        it "should parse list networks endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.list_networks()
        end
    end
end