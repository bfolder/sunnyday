require 'net/http'
require 'json'

module SunnyDay
  class Client
    attr_accessor :config

    def initialize(config = nil)
      @config = config.nil? ? SunnyDay::Configuration.new : config
    end

    def configure
      yield(@config) if block_given?
    end

    def current_weather(options = {})
      call('weather', options)
    end

    def forecast(options = {})
      call('forecast', options)

    end

    def daily_forecast(options = {})
      call('forecast/daily', options)
    end

    def find(options = {})
      call('find', options)
    end

  private

    def call(path, options = {})
      options.delete(:mode) if options.has_key?(:mode)
      uri = "/data/#{@config.api_version}/#{full_path(path, options)}language=#{@config.language}"
      uri.concat("&units=#{@config.units}") unless @config.units.nil?
      uri.concat("&APPID=#{@config.app_id}") unless @config.app_id.nil?
      response = Net::HTTP.get_response(BASE_URL, uri)
      JSON.parse(response.body, symbolize_names: true)
    end

    def full_path(path, options)
      string = ''
      options.each_key do |key|
        string << "#{key}=#{options[key]}&"
      end
      "#{path}?#{string}"
    end
  end
end
