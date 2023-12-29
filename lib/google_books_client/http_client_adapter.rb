# frozen_string_literal: true

require "faraday"

module GoogleBooksClient
  class HttpClientAdapter
    def get(url, params = {}, headers = {})
      connection.get(url, base_params.merge(params), base_headers.merge(headers))
    end

    protected

    def base_url
      GoogleBooksClient.configuration.api_host
    end

    def max_results
      GoogleBooksClient.configuration.max_results
    end

    def base_params
      {
        maxResults: max_results
      }
    end

    def base_headers
      {
        "Content-Type" => "application/json",
        "Accept" => "application/json"
      }
    end

    def authentication
      { type: :none }
    end

    def connection
      @connection ||= Faraday.new do |faraday|
        faraday_auth(faraday)
        faraday_options(faraday)
        faraday_request(faraday)
        faraday_response(faraday)
        faraday.adapter Faraday.default_adapter
      end
    end

    def faraday_auth(_faraday)
      case authentication[:type]
      when :none
        nil
      else
        raise NotImplementedError, "Unknown authentication type: #{authentication[:type]}"
      end
    end

    def faraday_options(faraday)
      faraday.url_prefix = base_url
      faraday.options.timeout = GoogleBooksClient.configuration.timeout
      faraday.options.open_timeout = GoogleBooksClient.configuration.timeout
    end

    def faraday_request(faraday)
      faraday.request :json
    end

    def faraday_response(faraday)
      faraday.response :json
      faraday.response :logger, GoogleBooksClient.configuration.logger, { headers: false, bodies: true }
    end
  end
end
