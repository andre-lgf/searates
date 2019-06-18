module Searates
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a SeaRates initializer file in your application.'

      def copy_initializer
        template 'searates.rb', 'config/initializers/searates.rb'
      end
    end
  end
end