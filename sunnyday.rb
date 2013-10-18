require '../SunnyDay/client'

module SunnyDay
  class << self
    attr_accessor :client

    def client(app_id = nil)
      @client ||= SunnyDay::Client.new(app_id)
    end
  end
end