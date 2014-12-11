require "g5_facebook_api_client"
require 'webmock/rspec'
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
end

RSpec.configure do |c|
end
