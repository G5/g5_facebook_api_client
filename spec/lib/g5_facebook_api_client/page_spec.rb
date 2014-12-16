require "spec_helper"

describe G5FacebookApiClient::Page do
  let(:page_id) { "GetG5" }
  let(:client_id) { "121584141274833" }
  let(:client_secret) { "b0d3826624470f5f5c3e70ce70893ed4" }
  let(:page) { described_class.new(client_id, client_secret, page_id) }

  describe "#posts" do
    subject { VCR.use_cassette("page_posts") { page.posts } }

    it "fetches posts for a page" do
      expect(subject["data"].size).to eq(20)
    end

    describe "individual post data" do
      context "a post with no shares" do
        let(:post) { subject["data"].first }

        specify { expect(post["shares"]).to be_nil }
        specify { expect(post["message"]).to include("Check out a few G5ers") }
        specify { expect(post["id"]).to eq("15485466463_10152611792811464") }
        specify { expect(post["created_time"]).to eq("2014-12-15T21:40:09+0000") }

        it "has 'from' data" do
          expect(post["from"]).to eq({
            "category" => "Local business",
            "category_list" => [{
              "id" => "187133811318958",
              "name" => "Business Services"
            }],
            "name" => "G5",
            "id" => "15485466463"
          })
        end

        it "has 'likes' data" do
          expect(post["likes"]).to eq({
            "data" => [{
              "id" => "755437763",
              "name" => "Sara Lamb Hobin"
            }],
            "paging" => {
              "cursors" => {
                "after" => "NzU1NDM3NzYz",
                "before" => "NzU1NDM3NzYz"
              },
             "next" => "https://graph.facebook.com/v1.0/15485466463_10152611792811464/" \
                       "likes?limit=1&summary=true&access_token=121584141274833|" \
                       "EzolJusCGWQEJt_mnLvlo7Jiz_Q&after=NzU1NDM3NzYz"
            },
            "summary" => { "total_count" =>8 }
          })
        end
      end

      context "a post with no shares" do
        let(:post) { subject["data"].last }

        specify { expect(post["shares"]).to eq({ "count" => 1 }) }
      end
    end
  end
end

