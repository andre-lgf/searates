# SeaRates

Ruby gem to make requests to SeaRates REST API in a simple and easy way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'searates'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install searates

## Usage

Place your API Key as an environment variable at your server or replace the ENV value in the initializer `initializers/searates.rb`

```ruby
Searates.configure do |config|
  config.api_key = ENV['SEARATES_API_KEY']
  #config.api_key = 'XXXXXXXXXXXXXXXX'
end
```

### Logistics Explorer

To make requests, simple call the API you want and store the return in a variable. e.g.
```ruby
response = Searates::API::LogisticsExplorer(latfrom, lngfrom, latto, lngto)
```

you can also pass *true* after the lngto value if you also want the route info.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/searates.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
