class G5FacebookApiClient::User < G5FacebookApiClient::Base
  def permissions
    parse(get("#{user_uri}/permissions?#{access_token}"))
  end

  private

  def user_uri
    "#{G5FacebookApiClient::ENDPOINT}/#{@client_id}"
  end
end

