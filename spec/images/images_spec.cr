describe "Images endpoint" do


    describe "List Images endpoint" do
        images_list_response = File.read("spec/resources/images/list_images.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/images/json?all=false&digest=false").to_return(status: 200, body: images_list_response)
        it "should parse list images endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.list_images()
        end
    end

    describe "Inspect Images endpoint" do 
        inspect_image_response = File.read("spec/resources/images/inspect_image.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/images/123/json").to_return(status: 200, body: inspect_image_response)
        it "should parse inspect images endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.inspect_image("123")
        end
        
    end


    describe "Image History endpoint" do 
        image_history_response = File.read("spec/resources/images/image_history.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/images/123/history").to_return(status: 200, body: image_history_response)
        it "should parse image history endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.image_history("123")
        end
        
    end
end