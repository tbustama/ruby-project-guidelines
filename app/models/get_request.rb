require 'json'
require 'open-uri'
require 'net/http'

class GetRequest
    def initialize(url)
        @url = url
    end

    def parse 
        uri = URI.parse(@url)
        Net::HTTP.get_response(uri)
    end

    def parse_json
        JSON.parse(self.parse.body)
    end
end