module SunnyDay
  BASE_URL = 'api.openweathermap.org'

  class Configuration
    # App id. Default none.
    attr_accessor :app_id

    # API version. Default 2.5.
    attr_accessor :api_version

    # Language. Default 'en'
    attr_accessor :language

    # Units - 'metric' or 'imperial'. Default metric.
    attr_accessor :units

    def initialize(options = {})
      options.each_key do |key|
        instance_variable_set("@#{key}", options[key])
      end

      @api_version ||= '2.5'
      @units ||= 'metric'
      @language ||= 'en'
    end
  end
end