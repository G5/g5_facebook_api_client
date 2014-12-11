class G5FacebookApiClient::Insights
  RESOURCE = "insights"

  def initialize(client_id=nil, client_secret=nil)
    @client_id = client_id || "121584141274833"
    @client_secret = client_secret || "b0d3826624470f5f5c3e70ce70893ed4"
  end

  def page_likes(id)
    JSON.parse(request(resource("page_fans_locale/lifetime", id)))
  end

  def page_views(id)
    JSON.parse(request(resource("page_views", id)))
  end

  private

  def resource(metric, id)
    "#{id}/#{RESOURCE}/#{metric}?#{access_token}"
  end

  def request(resource)
    HTTParty.get(URI::encode("#{G5FacebookApiClient::BASE_URI}/#{resource}")).body
  end

  def access_token
    @access_token ||=
      G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
  end
end

