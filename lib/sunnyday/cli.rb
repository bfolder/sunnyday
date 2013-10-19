require 'thor'

module SunnyDay
  class CLI < Thor
    class_option :lat, :type => :numeric
    class_option :long, :type => :numeric
    class_option :id, :type => :numeric

    desc 'weather <city>', 'Retrieves current weather for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'
    def weather(city = nil)
      return unless validate(city)
      client.current_weather(options)
    end

    desc 'forecast <city>', 'Retrieves current forecast for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'
    def forecast(city = nil)
      return unless validate(city)
      client.forecast(w_options(city))
    end

    desc 'd_forecast <days> <city>', 'Retrieves daily forecast for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'

    def d_forecast(days, city = nil)
      return unless validate(city)
      opts = w_options(city)
      opts[:cnt] = days
      client.forecast(opts)
    end

    option :limit, :type => :numeric
    desc 'find  <city> --limit', 'Searching for city. You can provide a city name (standard) or latitude and longitude.'
    def find(city = nil)
      return unless validate(city)
      opts = w_options(city)
      opts[:cnt] = options[:limit]
      opts.delete(:limit) if opts.has_key?(:limit)
      client.find(opts)
    end

    private

    def validate(city)
      valid = !city.nil? || (!options[:lat].nil? && !options[:long].nil?) || !options[:id].nil?
      puts 'Sorry, your input doesn’t appear to be valid. Use "sunnyday help" to see available options.' unless valid
      valid
    end

    def w_options(city)
      opts = options.dup
      opts[:d] = city unless city.nil?
      opts
    end

    def client(config = {})
      SunnyDay.client(config)
    end
  end
end