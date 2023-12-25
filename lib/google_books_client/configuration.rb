# frozen_string_literal: true

module GoogleBooksClient
  class Configuration
    attr_accessor :token, :host, :api_version, :api_schema_registry

    attr_writer :cacher, :logger, :timeout

    def cacher
      @cacher || default_cacher
    end

    def logger
      @logger || default_logger
    end

    def api_host
      "#{host}/api/#{api_version}"
    end

    def timeout
      @timeout || 20
    end

    private

    def default_cacher
      @default_cacher ||= ActiveSupport::Cache::MemoryStore.new
    end

    def default_logger
      @default_logger ||= Logger.new($stdout)
    end
  end
end
