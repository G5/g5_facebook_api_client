require "spec_helper"

describe G5FacebookApiClient::Base do
  let(:client_id) { "121584141274833" }
  let(:client_secret) { "b0d3826624470f5f5c3e70ce70893ed4" }
  let(:base) { described_class.new(client_id, client_secret) }
  let(:response) { double(body: "bar") }

  describe "#parse" do
    subject { base.parse('{ "foo":"bar" }') }
    specify { expect(subject).to eq({ "foo" => "bar" }) }
  end

  describe "#get" do
    before { HTTParty.stub(get: response) }
    subject { base.get("foo") }

    specify { expect(subject).to eq("bar") }
  end

  describe "#post" do
    before { HTTParty.stub(post: response) }
    subject { base.post("http://foo.com") }

    specify { expect(subject).to eq("bar") }
  end

  describe "#encode" do
    subject { base.encode("foo|bar") }

    specify { expect(subject).to eq("foo%7Cbar") }
  end
end

