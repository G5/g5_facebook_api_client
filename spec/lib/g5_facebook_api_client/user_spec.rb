require "spec_helper"

describe G5FacebookApiClient::User do
  let(:client_id) { "509257122550305" }
  let(:client_secret) { "7fdaa62f5bdcbaeb7fd8b0f5ba137f7c" }
  let(:user) { described_class.new(client_id, client_secret) }

  describe "#permissions" do
    subject { VCR.use_cassette("user") { user.permissions } }

    it "returns an app's permissions" do
      expect(subject).to eq({
        "data" => [
          { "permission" => "public_profile", "status" => "live" },
          { "permission" => "user_friends", "status" => "live"},
          { "permission" => "email", "status" => "live" }
        ]
      })
    end
  end
end

