class G5FacebookApiClient::Base
  def initialize(client_id=nil, client_secret=nil)
    @client_id = client_id || ENV["FACEBOOK_ID"]
    @client_secret = client_secret || ENV["FACEBOOK_SECRET"]
  end

  protected

  def access_token
    @access_token ||=
      G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
  end
end
