require "http/client"
require "json"
require "./api_schema/api.cr"

module Docker 
    class Client
        def initialize(@url : String) # move to unix socket support
        end

        ##########
        # Images #
        ##########
        def list_images(all : Bool = false,digest : Bool = false) # need to add filters
            response = HTTP::Client.get("#{@url}/images/json?all=#{all}&digest=#{digest}")
            response_check(response)
            return Array(ImageList).from_json(response.body)
        end

        def pull_image(image_name : String, **args)
            # stub
            response = HTTP::Client.post("#{@url}/images/create?fromImage=#{image_name}")
            response_check(response)
            return response.body
        end

        def inspect_image(image_id : String)
            response = HTTP::Client.get("#{@url}/images/#{image_id}/json")
            response_check(response)
            return ImageInspect.from_json(response.body)
        end

        def image_history(image_id : String)
            response = HTTP::Client.get("#{@url}/images/#{image_id}/history")
            response_check(response)
            return Array(ImageHistory).from_json(response.body)
        end

        ##############
        # Containers #
        ##############
        def create_container(image_name : String, **args)
            body_params = Hash(String,String).new
            body_params["Image"] = image_name
            merged_params = body_params.merge(args.to_h)
            response = HTTP::Client.post("#{@url}/containers/create", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: merged_params.to_json)
            response_check(response)
            puts(response.body)
            parsed = ContainerCreate.from_json(response.body)
            return parsed.id
        end

        def start_container(container_id : String, **args)
            response = HTTP::Client.post("#{@url}/containers/#{container_id}/start", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: args.to_json)
            response_check(response)
            return response.body
        end
        
        def list_containers(all : Bool = false,size : Bool = false) # need to add filters and limit
            response = HTTP::Client.get("#{@url}/containers/json?all=#{all}&size=#{size}")
            response_check(response)
            return Array(ContainerList).from_json(response.body)
        end

        def inspect_container(container_id : String)
            response = HTTP::Client.get("#{@url}/containers/#{container_id}/json")
            response_check(response)
            return ContainerInspect.from_json(response.body)
        end

        def container_filesystem_changes(container_id : String)
            response = HTTP::Client.get("#{@url}/containers/#{container_id}/changes")
            response_check(response)
            return Array(ContainerFilesystemChange).from_json(response.body)
        end

        def container_processes(container_id : String)
            response = HTTP::Client.get("#{@url}/containers/#{container_id}/top")
            response_check(response)
            return ContainerProcesses.from_json(response.body)
        end

        ############
        # Networks #
        ############
        def list_networks() # need to add filters
            response = HTTP::Client.get("#{@url}/networks")
            response_check(response)
            return  Array(Network).from_json(response.body)
        end

        def inspect_network(network_id : String)
            response = HTTP::Client.get("#{@url}/networks/#{network_id}")
            response_check(response)
            return Network.from_json(response.body)
        end

        ############
        #  Volumes #
        ############
        def list_volumes()
            response = HTTP::Client.get("#{@url}/volumes")
            response_check(response)
            return VolumeList.from_json(response.body)
        end

        def inspect_volume(volume_id : String)
            response = HTTP::Client.get("#{@url}/volumes/#{volume_id}")
            response_check(response)
            return VolumeInspect.from_json(response.body)
        end

        ############
        #   Exec   #
        ############
        def create_exec(container_id : String = "", **args)
            raise Exception.new("No Exec ID supplied") unless container_id.size() > 0
            response = HTTP::Client.post("#{@url}/containers/#{container_id}/exec",headers: HTTP::Headers{"Content-Type" => "application/json"}, body: args.to_json)
            response_check(response)
            parsed = Hash(String,String).from_json(response.body)
            return parsed["Id"]
        end

        def start_exec(exec_id : String = "", detach : Bool = false, tty : Bool = false)
            if exec_id.size() == 0 
                raise Exception.new("No Exec ID supplied")
            end
            body_params = Hash(String,Bool).new
            body_params["Detach"] = detach
            body_params["Tty"] = tty
            response = HTTP::Client.post("#{@url}/exec/#{exec_id}/start", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: body_params.to_json)
            response_check(response)
            return response.body
        end

        def inspect_exec(exec_id : String)
            response = HTTP::Client.get("#{@url}/exec/#{exec_id}/json")
            response_check(response)
            return ExecInspect.from_json(response.body)
        end

        def resize_exec(exec_id : String, h : Int64, w : Int64)
            # stub 
        end


        private def response_check(response)
            if response.status_code != 200 && response.status_code != 201 && response.status_code != 204
                if response.status_code == 400 || response.status_code == 404 || response.status_code == 409 || response.status_code == 500 
                    error = DockerError.from_json(response.body)
                    raise DockerApiException.new(error.message)
                end
            end
        end

        struct DockerError include JSON::Serializable 
            property message : String
        end

    end

    class DockerApiException < Exception
    end
end
