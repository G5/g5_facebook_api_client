class G5FacebookApiClient::User < G5FacebookApiClient::Base
  def permissions
    parse(get(resource))
  end

  private

  def resource
    "#{G5FacebookApiClient::ENDPOINT}/#{@client_id}/permissions?#{access_token}"
  end
end

