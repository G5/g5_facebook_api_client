require "spec_helper"

describe G5FacebookApiClient::User do
  let(:client_id) { "121584141274833" }
  let(:client_secret) { "b0d3826624470f5f5c3e70ce70893ed4" }
  let(:user) { described_class.new(client_id, client_secret) }

  describe "#permissions" do
    subject { VCR.use_cassette("user") { user.permissions } }

    it "returns an app's permissions" do
      expect(subject).to eq("foo")
    end
  end
end

