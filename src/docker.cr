require "http/client"
require "json"
require "./api/api.cr"

module Docker 
    class Client
        def initialize(@url : String) # move to unix socket support
        end

        def list_images(all : Bool = false,digest : Bool = false) # need to add filters
            response = HTTP::Client.get("#{@url}/images/json?all=#{all}&digest=#{digest}")
            response_check(response)
            return Array(ImageList).from_json(response.body)
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

        def list_networks() # need to add filters
            response = HTTP::Client.get("#{@url}/networks")
            response_check(response)
            return  Array(NetworkList).from_json(response.body)
        end

        def list_volumes()
            response = HTTP::Client.get("#{@url}/volumes")
            response_check(response)
            return VolumeList.from_json(response.body)
        end

        # def listSecrets()
        #     response = HTTP::Client.get("#{@url}/secrets")
        #     response_check(response)
        #     return SecretList.from_json(response.body)
        # end

        private def response_check(response)
            if response.status_code != 200 
                if response.status_code == 400 
                    raise DockerApiException.new("Bad parameter.")
                elsif response.status_code == 500
                    raise DockerApiException.new("Server error.")
                end
            end
        end

    end

    class DockerApiException < Exception
    end
end
