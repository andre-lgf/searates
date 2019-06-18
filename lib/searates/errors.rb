module Searates
  module Errors
    class Configuration < StandardError; end
    
    module API
      class MissingParameters < StandardError; end
      class InvalidParameterValue < StandardError; end
    end
  end
end