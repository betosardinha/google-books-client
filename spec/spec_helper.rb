# frozen_string_literal: true

require "pry"
require "simplecov"
require "simplecov-lcov"
require "webmock/rspec"
require "active_support"
require "active_support/testing/time_helpers"

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::LcovFormatter
  ]
)

SimpleCov.start do
  add_filter(%r{^/config/})
  add_filter(%r{^/spec/})

  enable_coverage :branch
  track_files "lib/**/*.rb"
end

SimpleCov.at_exit do
  SimpleCov.result.format!
end

Dir["./lib/**/*.rb"].sort.each { |f| require f }
Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.include ActiveSupport::Testing::TimeHelpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    allow_any_instance_of(Logger).to receive(:add)
  end
end
