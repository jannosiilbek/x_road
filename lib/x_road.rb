require 'require_all'
require 'x_road/version'
require 'uuidtools'
require 'savon'
require 'x_road/active_x_road'
require 'x_road/active_x_road2'
require 'x_road/active_x_road3'
require 'x_road/kpr/laekumised_maksuametist.rb'

module XRoad
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :host
    attr_accessor :client_cert
    attr_accessor :client_key
    attr_accessor :log_level
    attr_accessor :consumer
    attr_accessor :ssl_verify

    def initialize
      @log_level = :info
      @ssl_verify = :none
    end
  end
end
