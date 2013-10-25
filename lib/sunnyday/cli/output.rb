require 'term/ansicolor'

module SunnyDay
  class Color
    extend Term::ANSIColor
  end
  class Output
    def weather(data)
      puts ''
      print Color.bold,"Weather data for #{data[:name]}, #{data[:sys][:country]}\n", Color.clear
      puts "Current temperature: #{data[:main][:temp]} degrees."
      puts ''
      print Color.red, "Max temperature: #{data[:main][:temp_max]} degrees.\n", Color.clear
      print Color.green, "Min temperature: #{data[:main][:temp_min]} degrees.\n", Color.clear
    end

    def forecast(data)
      puts data
    end

    def daily_forecast(data)
      puts data
    end

    def find(data)
      puts data
    end
  end
end