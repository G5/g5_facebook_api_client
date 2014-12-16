require "httparty"
require "pry"
require "g5_facebook_api_client/base"
require "g5_facebook_api_client/version"
require "g5_facebook_api_client/page"
require "g5_facebook_api_client/insights"
require "g5_facebook_api_client/user"
require "g5_facebook_api_client/access_token"

module G5FacebookApiClient
  ENDPOINT    = "https://graph.facebook.com"
  API_VERSION = "v2.2"
  BASE_URI    = "#{ENDPOINT}/#{API_VERSION}"
end

