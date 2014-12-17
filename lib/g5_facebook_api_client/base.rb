module G5FacebookApiClient
  class Base
    def initialize(client_id, client_secret, page=nil)
      @client_id = client_id
      @client_secret = client_secret
      @page = page
    end

    def access_token
      @access_token ||=
        G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
    end

    def parse(body)
      JSON.parse(body)
    end

    def get(url)
      HTTParty.get(encode(url)).body
    end

    def post(url)
      HTTParty.post(encode(url)).body
    end

    def encode(string)
      URI::encode(string)
    end
  end
end

