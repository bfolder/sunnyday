require 'sunnyday/configuration'
require 'sunnyday/client'

module SunnyDay
  class << self
    attr_accessor :client

    def client(options = {})
      @client ||= SunnyDay::Client.new(options)
    end
  end
end