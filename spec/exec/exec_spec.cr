describe "Exec endpoint" do
    client = Docker::Client.new("http://127.0.0.1:2375")

    describe "Inspect exec endpoint" do
        inspect_exec_response = File.read("spec/resources/exec/inspect_exec.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/exec/123/json").to_return(status: 200, body: inspect_exec_response)
        it "should parse inspect exec endpoint correctly" do 
            client.inspect_exec("123")
        end
    end

    describe "Create exec endpoint" do
        create_exec_response = File.read("spec/resources/exec/create_exec_response.json")
        WebMock.stub(:post, "http://127.0.0.1:2375/containers/d7aed543822f/exec").with(body: "{\"attachStdin\":false,\"cmd\":[\"id\"],\"AttachStdout\":true}", headers: {"Content-Type" => "application/json"}).to_return(status: 201, body: create_exec_response)
        it "should parse inspect exec endpoint correctly" do 
            client.create_exec("d7aed543822f", attachStdin: false, cmd: ["id"], AttachStdout: true)
        end
    end

    describe "Start spec endpoint" do 
        start_exec_response = File.read("spec/resources/exec/start_exec_response.json")
        WebMock.stub(:post, "http://127.0.0.1:2375/exec/123/start").to_return(status: 200, body: start_exec_response)
        it "should parse start exec endpoint correctly" do 
            client.start_exec("123")
        end
    end

end