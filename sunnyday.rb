require '../sunnyday/client'
require '../sunnyday/configuration'

module SunnyDay
  class << self
    attr_accessor :client

    def client(options = {})
      @client ||= SunnyDay::Client.new(SunnyDay::Configuration.new(options))
    end
  end
end