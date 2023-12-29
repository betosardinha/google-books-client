# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/object"
require "active_support/core_ext/hash"

require_relative "google_books_client/version"
require_relative "google_books_client/configuration"
require_relative "google_books_client/http_client_adapter"
require_relative "google_books_client/models"
require_relative "google_books_client/resources"

module GoogleBooksClient
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
