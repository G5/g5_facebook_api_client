class G5FacebookApiClient::AccessToken
  RESOURCE = "oauth/access_token"

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def fetch
    HTTParty.get(URI::encode(access_token_uri)).body
  end

  private

  def access_token_uri
    "#{G5FacebookApiClient::ENDPOINT}/#{RESOURCE}" \
    "?client_id=#{@client_id}&client_secret=#{@client_secret}" \
    "&grant_type=client_credentials"
  end
end
