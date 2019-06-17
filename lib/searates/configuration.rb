module Searates
  class Configuration    
    attr_accessor :api_key

    def initialize
      @api_key ||= nil
    end
    
    def api_key
      raise Searates::Errors::Configuration, 'SeaRates API Key missing!' unless @api_key
      @api_key
    end
  end
end