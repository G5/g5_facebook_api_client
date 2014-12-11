class G5FacebookApiClient::Insights
  RESOURCE = "insights"

  def initialize
    @client_id     = "121584141274833"
    @client_secret = "b0d3826624470f5f5c3e70ce70893ed4"
  end

  def access_token
    @access_token ||=
      G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
  end

  def url
    "#{ENDPOINT}/#{G5FacebookApiClient::API_VERSION}"
  end
end
