<img src="https://github.com/betosardinha/google_books_client/assets/38788696/3137d5f7-d6a6-4f82-bd44-3ea334950e1f" width="250">

# GoogleBooksClient

The Google Books client is a simple Ruby gem that centralizes requests and communications with the Google Books API.

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/betosardinha/google_books_client/ruby-ci.yml)
![GitHub License](https://img.shields.io/github/license/betosardinha/google_books_client)
![GitHub release (with filter)](https://img.shields.io/github/v/release/betosardinha/google_books_client)
![Gem Total Downloads](https://img.shields.io/gem/dt/google_books_client)



## Table of Contents
1. [Installation](#installation)
2. [Usage](#usage)
    - [Configuration](#configuration)
    - [Models](#models)
    - [Resources](#resources)
3. [Development](#development)
4. [Tools](#tools)
5. [Contributing](#contributing)
6. [Versioning](#versioning)
7. [License](#license)
8. [Code of Conduct](#code-of-conduct)
9. [Contact](#contact)

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add google_books_client
```

Or add it manually to the Gemfile:

```ruby
gem 'google_books_client'
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install google_books_client
```

## Usage

### Configuration
To use the gem, you must first configure it in an initializer file at your project, for example:

```ruby
# frozen_string_literal: true

require 'google_books_client'

GoogleBooksClient.configure do |config|
  config.api_version = 'v1'
  config.max_results = 10
  config.timeout = 20
end
```

The configuration options are:
- **api_version**: The version of the Google Books API to be used. The default is `v1`.
- **cacher**: The cacher to be used. The default is `ActiveSupport::Cache::MemoryStore`.
- **logger**: The logger to be used. The default is `Logger.new($stdout)`.
- **max_results**: The maximum number of results to be returned by the API. The default is `10`.
- **timeout**: The timeout in seconds to be used in the requests. The default is `20`.

### Models

The models objective is to centralize the attributes and methods of the Google Books API resources. And make it easy to serialize and validate the data returned by the API. The models are:

- **Volume**: Represents a volume in the Google Books API.

You can use the models to serialize the data returned by the API, for example:

```ruby
# frozen_string_literal: true

module GoogleBooks
  module Serializers
    class Volume < GoogleBooksCLient::Models::Volume
      def id
        id
      end

      def kind
        kind
      end

      def title
        volume_info.title
      end

      def publisher
        volume_info.publisher
      end
    end
  end
end

GoogleBooks::Serializers::Volume.serialize(volume)
```

### Resources

The resources objective is to centralize the requests and communications with the Google Books API. The resources are:

- **Volumes**: Represents the volumes resource in the Google Books API.

You can use the resources to make requests to the API, for example:

```ruby
GoogleBooksClient::Resources::Volumes.list_by_isbn('8532516262')

GoogleBooksClient::Resources::Volumes.list_by_title('Coraline')
```

A full list of the available methods for each resource class can be found in the [resources documentation](doc/resources.md).

## Development

```bash
docker-compose build google_books_client # To build the image
docker-compose up -d google_books_client # To start the container detached
docker-compose exec google_books_client bash # To access the container
```

## Tools

The tools can be used inside the container or locally.

```bash
./bin/setup # To install dependencies
./bin/console # To start the pry with the gem loaded
./bin/test # To run the tests, rubocop and coverage
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/betosardinha/google_books_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/betosardinha/google_books_client/blob/master/CODE_OF_CONDUCT.md).

## Versioning

This project uses [Semantic Versioning](https://semver.org/).

For a new release, update the version number in `lib/google_books_client/version.rb`, and then create a new release on GitHub. It will automatically be published to [RubyGems](https://rubygems.org/gems/google_books_client).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Google::Books::Client project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/betosardinha/google_books_client/blob/master/CODE_OF_CONDUCT.md).

## Contact

If you have any questions about the project, please contact me at:
- Email: [sardinhabeto55@gmail.com](mailto:sardinhabeto55@gmail.com)
- Linkedin: [betosardinha](https://www.linkedin.com/in/betosardinha/)
- Twitter: [sardinhabeto](https://twitter.com/sardinhabeto)

## Support

If this project helped you, please consider giving it a star. It will mean a lot to me.

And if you consider my work valuable for your projects, you can support me on [Buy Me a Coffee](https://www.buymeacoffee.com/betosardinha).