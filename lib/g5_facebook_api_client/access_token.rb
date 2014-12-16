class G5FacebookApiClient::AccessToken < G5FacebookApiClient::Base
  RESOURCE = "oauth/access_token"

  def fetch
    get(encode(access_token_uri))
  end

  private

  def access_token_uri
    "#{G5FacebookApiClient::ENDPOINT}/#{RESOURCE}" \
    "?client_id=#{@client_id}&client_secret=#{@client_secret}" \
    "&grant_type=client_credentials"
  end
end
