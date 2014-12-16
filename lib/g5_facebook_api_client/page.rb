class G5FacebookApiClient::Page < G5FacebookApiClient::Base
  DEFAULT_LIMIT = 20

  def initialize(page, limit=nil, client_id=nil, client_secret=nil)
    @page = page
    @limit = limit || DEFAULT_LIMIT
    @client_id = client_id || ENV["FACEBOOK_ID"]
    @client_secret = client_secret || ENV["FACEBOOK_SECRET"]
  end

  def posts
    parse(get(posts_uri))["data"]
  end

  private

  def posts_uri
    "#{G5FacebookApiClient::ENDPOINT}/#{@page}/#{feed_parameters}&#{default_parameters}"
  end

  def default_parameters
    "limit=20&#{access_token}"
  end

  def feed_parameters
    "posts?fields=likes.limit(1).summary(true),shares,message,id,created_time,from"
  end
end

