require "x_road/version"

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
    attr_accessor :port
    attr_accessor :client_cert
    attr_accessor :client_key
    attr_accessor :log_level
    attr_accessor :consumer
    attr_accessor :log_level

    def initialize
      @log_level = :info
    end
  end

  def self.request(m)
  end

  private
  def self.create_client
    config = XRoad.configuration

    Savon.client do
      endpoint config.host
      ssl_cert_file config.client_cert
      ssl_cert_key_file config.client_key
      pretty_print_xml true
      ssl_verify_mode :none
      log true
      log_level config.log_level
      namespace_identifier "kpr"
      namespace "http://producers.kpr.xtee.riik.ee/producer/kpr"
      namespaces(
        "xmlns:xtee" => "http://x-road.ee/xsd/x-road.xsd"
      )
    end
  end
end
