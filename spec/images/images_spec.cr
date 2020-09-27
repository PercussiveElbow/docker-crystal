describe "Images endpoint" do


    describe "List Images endpoint" do
        images_list_response = File.read("spec/resources/list_images.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/images/json?all=false&digest=false").to_return(status: 200, body: images_list_response)
        it "should parse list images endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.list_images()
        end
    end
end