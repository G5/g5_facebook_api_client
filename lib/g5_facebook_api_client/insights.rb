class G5FacebookApiClient::Insights < G5FacebookApiClient::Base
  RESOURCE = "insights"

  def initialize(page, client_id=nil, client_secret=nil)
    @page = page
    @client_id = client_id || ENV["FACEBOOK_ID"]
    @client_secret = client_secret || ENV["FACEBOOK_SECRET"]
  end

  def page_likes
    parse(request(resource("page_fans_locale/lifetime")))
  end

  def page_views
    parse(request(resource("page_views")))
  end

  def page_impressions
    parse(request(resource("page_impressions")))
  end

  private

  def resource(metric)
    "#{@page}/#{RESOURCE}/#{metric}?#{access_token}"
  end

  def request(resource)
    get(encode("#{G5FacebookApiClient::BASE_URI}/#{resource}"))
  end
end

