require 'configuration'

module SunnyDay
  class Client
    attr_accessor :config

    def initialize(configuration)
      @config = configuration
    end

    def configure
      yield(@config) if block_given?
    end

    def current_weather(options = {})

    end

    def forecast(options = {})

    end

    def daily_forecast(options = {})

    end
  end
end
