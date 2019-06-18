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

Run the Generator:

    $ rails g searates:install


Place your API Key as an environment variable at your server or replace the ENV value in the initializer `initializers/searates.rb`

```ruby
Searates.configure do |config|
  config.api_key = ENV['SEARATES_API_KEY']
  #config.api_key = 'XXXXXXXXXXXXXXXX'
end
```

### Logistics Explorer - FCL Rates

To make requests, simple call the API you want and store the return in a variable. e.g.
```ruby
response = Searates::API::LogisticsExplorer.get_fcl_rates(lat_from, lng_from, lat_to, lng_to)
```

you can also pass *true* after the lng_to value if you also want the route info.

### Logistics Explorer - LCL Rates

- Weight of cargo in *kg*
- Volume of cargo in *CBM*

```ruby
response = Searates::API::LogisticsExplorer.get_lcl_rates(lat_from, lng_from, lat_to, lng_to, volume, weight)
```

### Logistics Explorer - Sea Route

```ruby
response = Searates::API::LogisticsExplorer.get_sea_route(lat_from, lng_from, lat_to, lng_to)
```

### Logistics Explorer - Air Rates

- Weight of cargo in *tons*

```ruby
response = Searates::API::LogisticsExplorer.get_air_rates(lat_from, lng_from, lat_to, lng_to, weight)
```

### Logistics Explorer - Rail Rates

```ruby
response = Searates::API::LogisticsExplorer.get_rail_rates(lat_from, lng_from, lat_to, lng_to)
```

### Logistics Explorer - Road Rates

- Weight of cargo in *kg*
- Volume of cargo in *CBM*
- Type of shipment. The available values for this parameter are: `LTL | FTL | CONTAINER` *(optional) Default value: CONTAINER*
- Container type. The available values for this parameter are: `20st | 40st | 40hq | 20ref | 40ref` *(optional) Default value: 20st*

```ruby
response = Searates::API::LogisticsExplorer.get_road_rates(lat_from, lng_from, lat_to, lng_to, volume, weight, type, container)
```

## For more information, please visit the [official  API documentation](https://www.searates.com/reference/platform-api/)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andre-lgf/searates.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
