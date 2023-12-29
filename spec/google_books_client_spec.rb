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
      expect(config.api_host).to eq("https://www.googleapis.com/books/v1")
      expect(config.api_name).to eq("books")
      expect(config.api_version).to eq("v1")
      expect(config.cacher).to be_instance_of(ActiveSupport::Cache::MemoryStore)
      expect(config.host).to eq("https://www.googleapis.com")
      expect(config.logger).to be_instance_of(Logger)
      expect(config.max_results).to eq(10)
      expect(config.timeout).to eq(20)
    end
  end
end
