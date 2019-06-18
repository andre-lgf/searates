require "bundler/setup"
require "searates"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  config.before(:all) do
    Searates.configure do |config|
      config.api_key = ENV['SEARATES_API_KEY']
    end
  end
  
  config.before(:each) do
    @lat_from = 24.8607343
    @lng_from = 67.00113639999995
    @lat_to = 46.482526
    @lng_to = 30.723309500000028
    @weight = 1000
    @volume = 1
  end
end
