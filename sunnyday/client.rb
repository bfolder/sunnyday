module SunnyDay
  class Client
    attr_accessor :config

    def initialize(configuration)
      @config ||= configuration
    end

    def configure
      yield(@config) if block_given?
    end
  end
end
