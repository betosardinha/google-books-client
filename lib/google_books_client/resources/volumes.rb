# frozen_string_literal: true

module GoogleBooksClient
  module Resources
    class Volumes < HttpClientAdapter
      def self.show(volume_id)
        new.get("volumes/#{volume_id}")
      end

      def self.list(params = {})
        new.get("volumes", params)
      end

      def self.list_by_query(query, params: {}, start_index: 0)
        list(params.merge({ q: query, startIndex: start_index }))
      end

      def self.list_volumes(search_hash, params: {}, start_index: 0)
        list_by_query(generate_query(search_hash), params: params, start_index: start_index)
      end

      def self.list_by_title(title, params: {}, start_index: 0)
        list_volumes({ title: title }, params: params, start_index: start_index)
      end

      def self.list_by_author(author, params: {}, start_index: 0)
        list_volumes({ author: author }, params: params, start_index: start_index)
      end

      def self.list_by_publisher(publisher, params: {}, start_index: 0)
        list_volumes({ publisher: publisher }, params: params, start_index: start_index)
      end

      def self.list_by_subject(subject, params: {}, start_index: 0)
        list_volumes({ subject: subject }, params: params, start_index: start_index)
      end

      def self.list_by_isbn(isbn, params: {})
        list_volumes({ isbn: isbn }, params: params)
      end

      def self.list_by_lccn(lccn, params: {})
        list_volumes({ lccn: lccn }, params: params)
      end

      def self.list_by_oclc(oclc, params: {})
        list_volumes({ oclc: oclc }, params: params)
      end

      def self.generate_query(search_hash)
        search_hash.map do |search_type, search_value|
          case search_type
          when :title, :author, :publisher
            "in#{search_type}:#{search_value}"
          when :subject, :isbn, :lccn, :oclc
            "#{search_type}:#{search_value}"
          else
            raise ArgumentError, "Invalid search type"
          end
        end.join("+")
      end
    end
  end
end
