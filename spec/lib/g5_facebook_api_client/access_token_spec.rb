require "spec_helper"

describe G5FacebookApiClient::AccessToken do
  let(:client_id) { "121584141274833" }
  let(:client_secret) { "b0d3826624470f5f5c3e70ce70893ed4" }
  let(:access_token_fetcher) { described_class.new(client_id, client_secret) }

  describe "#fetch" do
    subject { access_token_fetcher.fetch }

    context "valid params" do
      it "fetches an access token for a client" do
        VCR.use_cassette("access_token") do
          expect(subject).
            to eq("access_token=121584141274833|EzolJusCGWQEJt_mnLvlo7Jiz_Q")
        end
      end
    end

    context "invalid client_id param" do
      let(:client_id) { "foo" }

      it "it explodes with an oauth error" do
        VCR.use_cassette("access_token_invalid_client_id") do
          expect(subject).to include("OAuthException")
        end
      end
    end

    context "invalid client_id param" do
      let(:client_secret) { "bar" }

      it "it explodes with an oauth error" do
        VCR.use_cassette("access_token_invalid_client_secret") do
          expect(subject).to include("OAuthException")
        end
      end
    end
  end
end

