require 'term/ansicolor'

module SunnyDay
  class Color
    extend Term::ANSIColor
  end

  class Output
    def weather(data)
      return if has_error?(data)
      print Color.bold, "\nWeather data for #{data[:name]}, #{data[:sys][:country]}\n", Color.clear
      puts Color.green, "Current temperature: #{data[:main][:temp]} degrees.", Color.clear
      puts "Weather: #{data[:weather][0][:description]}\n"
      puts ''
      print "Max temperature: #{data[:main][:temp_max]} degrees.\n"
      print "Min temperature: #{data[:main][:temp_min]} degrees.\n"
      print "Sunrise: #{Time.at(data[:sys][:sunrise])}\n"
      print "Sunset: #{Time.at(data[:sys][:sunset])}\n"
      puts ''
    end

    def forecast(data)
      return if has_error?(data)
      puts data
    end

    def daily_forecast(data)
      return if has_error?(data)
      puts data
    end

    def find(data)
      return if has_error?(data)
      print Color.bold, "\nFound #{data[:count]} #{data[:count] == 1 ? 'entry' : 'entries'}:\n\n", Color.clear
      data[:list].each do |entry|
        print Color.green, "#{entry[:name]}, #{entry[:sys][:country]} -> id: #{entry[:id]}\n",Color.clear
      end
    end

  private

    def has_error?(data)
      has_error = data[:cod].to_s != '200'
      error(data[:message]) if has_error
    end

    def error(message)
      print Color.red, "\n#{message}\n", Color.clear
    end
  end
end