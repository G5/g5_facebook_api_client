class G5FacebookApiClient::Insights
  RESOURCE = "insights"

  def initialize(client_id, client_secret)
    @client_id     = client_id
    @client_secret = client_secret
  end

  private

  def access_token
    @access_token ||=
      G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
  end

  def url
    "#{ENDPOINT}/#{G5FacebookApiClient::API_VERSION}"
  end
end
