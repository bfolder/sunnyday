require 'thor'

module SunnyDay
  class CLI < Thor
    class_option :lat, :type => :numeric
    class_option :long, :type => :numeric
    class_option :id, :type => :numeric

    desc 'weather <city> --lat \'latitude\' --long \’longitude\’ --id \’city id\’', 'Retrieves current weather for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'
    def weather(city = nil)
      return unless validate(city)
      client.weather(options)
    end

    desc 'forecast <city> --lat \'latitude\' --long \’longitude\’ --id \’city id\’', 'Retrieves current forecast for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'
    def forecast(city = nil)
      return unless validate(city)
      client.forecast(options)
    end

    desc 'd_forecast <days> <city> --lat \'latitude\' --long \’longitude\’ --id \’city id\’', 'Retrieves daily forecast for a specific city. You can provide a city name (standard), latitude and longitude or a city id.'
    def d_forecast(days, city = nil)
      return unless validate(city)
      options[:cnt] = days
      client.forecast(options)
    end

    option :limit, :type => :Integer
    desc 'find  <city> --limit \'limite results\' --lat \'latitude\' --long \’longitude\’', 'Searching for city. You can provide a city name (standard) or latitude and longitude.'
    def find(city = nil)
      return unless validate(city)
      options[:cnt] = options[:limit]
      options.delete(:limit) if options.has_key?(:limit)
      client.find(options)
    end

    private

    def validate(city)
      valid = !city.nil? || (!options[:lat].nil? && !options[:long].nil?) || !option[:id].nil?
      puts 'Sorry, your input doesn\’t appear to be valid.' unless valid
      options[:d] = city unless city.nil?
      valid
    end

    def client(config = {})
      SunnyDay.client(config)
    end
  end
end