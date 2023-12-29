# frozen_string_literal: true

require "logger"

module GoogleBooksClient
  class Configuration
    attr_writer :api_version, :cacher, :logger, :max_results, :timeout

    def api_host
      "#{host}/#{api_name}/#{api_version}"
    end

    def api_name
      default_api_name
    end

    def api_version
      @api_version || default_api_version
    end

    def cacher
      @cacher || default_cacher
    end

    def host
      default_host
    end

    def logger
      @logger || default_logger
    end

    def max_results
      @max_results || 10
    end

    def timeout
      @timeout || 20
    end

    private

    def default_api_name
      "books"
    end

    def default_api_version
      "v1"
    end

    def default_cacher
      @default_cacher ||= ActiveSupport::Cache::MemoryStore.new
    end

    def default_host
      "https://www.googleapis.com"
    end

    def default_logger
      @default_logger ||= Logger.new($stdout)
    end
  end
end
