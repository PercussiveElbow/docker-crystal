describe "Exec endpoint" do
    client = Docker::Client.new("http://127.0.0.1:2375")

    describe "Inspect exec endpoint" do
        inspect_exec_response = File.read("spec/resources/iexec/inspect_exec.json")
        WebMock.stub(:get, "http://127.0.0.1:2375/exec/123/json").to_return(status: 200, body: inspect_exec_response)
        it "should parse inspect exec endpoint correctly" do 
            client = Docker::Client.new("http://127.0.0.1:2375")
            client.inspect_exec("123")
        end
    end

end