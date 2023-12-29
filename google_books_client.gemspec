# frozen_string_literal: true

require_relative "lib/google_books_client/version"

Gem::Specification.new do |spec|
  spec.name = GoogleBooksClient::NAME
  spec.version = GoogleBooksClient::VERSION
  spec.summary = "A simple client for Google Books API."
  spec.description = "A simple client for Google Books API. Provides a interface for searching and serializing volumes."

  spec.homepage = "https://github.com/betosardinha/google_books_client"
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "MIT"

  spec.author = "Beto Sardinha"
  spec.email = "sardinhabeto55@gmail.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/betosardinha/google_books_client/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://github.com/betosardinha/google_books_client/blob/main/README.md"
  spec.metadata["source_code_uri"] = "https://github.com/betosardinha/google_books_client/tree/v#{GoogleBooksClient::VERSION}"
  spec.metadata["bug_tracker_uri"] = "https://github.com/betosardinha/google_books_client/issues"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }

  spec.add_dependency "activesupport", "~> 7.1", ">= 7.1.2"
  spec.add_dependency "faraday", "~> 2.8", ">= 2.8.1"
  spec.add_dependency "json_schemer", "~> 2.1", ">= 2.1.1"
  spec.add_dependency "racecar", "~> 2.9"
  spec.add_dependency "rake", "~> 13.0"
end
