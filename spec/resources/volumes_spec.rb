# frozen_string_literal: true

RSpec.describe GoogleBooksClient::Resources::Volumes do
  let(:volume_id) { "zyTCAlFPjgYC" }
  let(:query) { "flowers+inauthor:keyes" }
  let(:params) { { maxResults: 5 } }
  let(:start_index) { 0 }

  describe ".show" do
    subject { described_class.show(volume_id) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes/#{volume_id}"] }
    end
  end

  describe ".list" do
    subject { described_class.list(params) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", params] }
    end
  end

  describe ".list_by_query" do
    subject { described_class.list_by_query(query, params: params, start_index: start_index) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
    end
  end

  describe ".list_volumes" do
    subject { described_class.list_volumes(search_hash, params: params, start_index: start_index) }

    context "when search_hash is valid" do
      let(:search_hash) { { title: "flowers", author: "keyes" } }

      it_behaves_like "sends request to google books api correctly" do
        let(:http_method) { :get }
        let(:query) { "intitle:flowers+inauthor:keyes" }
        let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      end
    end

    context "when search_hash is invalid" do
      let(:search_hash) { { invalid: "flowers" } }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError, "Invalid search type")
      end
    end
  end

  describe ".list_by_title" do
    let(:title) { "flowers" }

    subject { described_class.list_by_title(title, params: params, start_index: start_index) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "intitle:flowers" }
    end
  end

  describe ".list_by_author" do
    let(:author) { "keyes" }

    subject { described_class.list_by_author(author, params: params, start_index: start_index) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "inauthor:keyes" }
    end
  end

  describe ".list_by_publisher" do
    let(:publisher) { "rocco" }

    subject { described_class.list_by_publisher(publisher, params: params, start_index: start_index) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "inpublisher:rocco" }
    end
  end

  describe ".list_by_subject" do
    let(:subject_value) { "flowers" }

    subject { described_class.list_by_subject(subject_value, params: params, start_index: start_index) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "subject:flowers" }
    end
  end

  describe ".list_by_isbn" do
    let(:isbn) { "0747532699" }

    subject { described_class.list_by_isbn(isbn, params: params) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "isbn:0747532699" }
    end
  end

  describe ".list_by_lccn" do
    let(:lccn) { "98048012" }

    subject { described_class.list_by_lccn(lccn, params: params) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "lccn:98048012" }
    end
  end

  describe ".list_by_oclc" do
    let(:oclc) { "123456789" }

    subject { described_class.list_by_oclc(oclc, params: params) }

    it_behaves_like "sends request to google books api correctly" do
      let(:http_method) { :get }
      let(:request_params) { ["volumes", { q: query, startIndex: start_index }.merge(params)] }
      let(:query) { "oclc:123456789" }
    end
  end
end