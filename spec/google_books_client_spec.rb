# frozen_string_literal: true

RSpec.describe GoogleBooksClient do
  it "has a name" do
    expect(described_class::NAME).to eq("google_books_client")
  end

  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end

  describe ".configure" do
    let(:config) { described_class.configuration }

    it "returns expected configuration" do
      expect(config.token).to eq("token")
      expect(config.host).to eq("host")
      expect(config.api_version).to eq("v1")
      expect(config.api_schema_registry).to eq("api_schema_registry")
      expect(config.api_host).to eq("host/api/v1")
      expect(config.timeout).to eq(20)
      expect(config.logger).to be_instance_of(Logger)
      expect(config.cacher).to be_instance_of(ActiveSupport::Cache::MemoryStore)
    end
  end
end
