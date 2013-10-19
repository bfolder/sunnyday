require 'net/http'
require 'json'
require '../sunnyday/configuration'

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
      call_method('weather', options)
    end

    def forecast(options = {})
      call_method('forecast', options)

    end

    def daily_forecast(options = {})
      call_method('forecast/daily', options)
    end

    private

    def call_method(path, options = {})
      options.delete(:mode) if options.has_key?(:mode)
      uri = "/data/#{@config.api_version}/#{path_from_options(path, options)}"
      response = Net::HTTP.get_response(BASE_URL, uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def path_from_options(path, options)
      string = ''
      options.each_key do |key|
        string << "#{key}=#{options[key]}&"
      end
      string.chop! if string[-1, 1] == '&'
      "#{path}?#{string}"
    end
  end
end
