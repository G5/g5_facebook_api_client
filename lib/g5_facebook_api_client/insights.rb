class G5FacebookApiClient::Insights < G5FacebookApiClient::Base
  RESOURCE = "insights"

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
    get("#{G5FacebookApiClient::BASE_URI}/#{resource}")
  end
end

