class G5FacebookApiClient::Insights
  RESOURCE = "insights"

  def initialize(page, client_id=nil, client_secret=nil)
    @page = page
    @client_id = client_id || ENV["FACEBOOK_ID"]
    @client_secret = client_secret || ENV["FACEBOOK_SECRET"]
  end

  def page_likes
    JSON.parse(request(resource("page_fans_locale/lifetime")))
  end

  def page_views
    JSON.parse(request(resource("page_views")))
  end

  def page_impressions
    JSON.parse(request(resource("page_impressions")))
  end

  private

  def resource(metric)
    "#{@page}/#{RESOURCE}/#{metric}?#{access_token}"
  end

  def request(resource)
    HTTParty.get(URI::encode("#{G5FacebookApiClient::BASE_URI}/#{resource}")).body
  end

  def access_token
    @access_token ||=
      G5FacebookApiClient::AccessToken.new(@client_id, @client_secret).fetch
  end
end

