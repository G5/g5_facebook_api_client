class G5FacebookApiClient::User < G5FacebookApiClient::Base
  def permissions
    parse(get(uri))
  end

  private

  def uri
    encode("#{G5FacebookApiClient::ENDPOINT}/#{@client_id}/permissions?#{access_token}")
  end
end

