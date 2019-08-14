module Searates
  module API
    class LogisticsExplorer
      BASE_URL = 'https://sirius.searates.com/port/api-'
      def self.get_fcl_rates(lat_from, long_from, lat_to, long_to, route_info=false)
        [lat_from, long_from, lat_to, long_to].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}fcl?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}&route_info=#{route_info}"
        response = JSON.parse(URI.open(request_url).read)
      end
      
      def self.get_lcl_rates(lat_from, long_from, lat_to, long_to, weight, volume)
        [lat_from, long_from, lat_to, long_to, weight, volume].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}lcl?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}&weight=#{weight}&volume=#{volume}"
        response = JSON.parse(URI.open(request_url).read)
      end
      
      def self.get_sea_route(lat_from, long_from, lat_to, long_to)
        [lat_from, long_from, lat_to, long_to].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}path?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}"
        response = JSON.parse(URI.open(request_url).read)
      end
      
      def self.get_air_rates(lat_from, long_from, lat_to, long_to, weight)
        [lat_from, long_from, lat_to, long_to, weight].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}air?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}&weight=#{weight}"
        response = JSON.parse(URI.open(request_url).read)
      end
      
      def self.get_rail_rates(lat_from, long_from, lat_to, long_to)
        [lat_from, long_from, lat_to, long_to].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}rail?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}"
        response = JSON.parse(URI.open(request_url).read)
      end
      
      def self.get_road_rates(lat_from, long_from, lat_to, long_to, weight, volume, type='CONTAINER', container='20st')
        [lat_from, long_from, lat_to, long_to, weight, volume, type, container].each{|param| raise Searates::Errors::API::MissingParameters, "Missing parameter: #{param}" unless param}
        request_url = "#{BASE_URL}road?apiKey=#{Searates.configuration.api_key}&lat_from=#{lat_from}&lng_from=#{long_from}&lat_to=#{lat_to}&lng_to=#{long_to}&weight=#{weight}&volume=#{volume}"
        if type
          raise Searates::Errors::API::InvalidParameterValue unless ['FCL', 'LCL', 'CONTAINER'].include? type.upcase
          request_url += "&type=#{type.upcase}"
        end
        if container
          raise Searates::Errors::API::InvalidParameterValue unless container.downcase =~ /20st|40st|40hq|20ref|40ref/
          request_url += "&container=#{container.downcase}"
        end
        response = JSON.parse(URI.open(request_url).read)
      end
    end
  end
end
