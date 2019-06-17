require "searates/version"
require 'searates/configuration'
require 'searates/errors'
require 'searates/api'

module Searates
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
