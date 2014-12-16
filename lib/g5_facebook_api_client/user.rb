class G5FacebookApiClient::User < G5FacebookApiClient::Base
  def permissions
    JSON.parse(URI::encode("#{G5FacebookApiClient::ENDPOINT}/#{@client_id}/permissions?#{access_token}"))
  end
end

