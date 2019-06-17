module Searates
  module API
    class LogisticsExplorer
      def self.get_fcl_rates(lat_from, long_from, lat_to, long_to, route_info=false)
        base_url = 'https://sirius.searates.com/port/api-fcl?'
        request_url = "#{base_url}apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}&route_info=#{route_info}"
        response = JSON.parse(URI.open(request_url).read)
      end
    end
  end
end