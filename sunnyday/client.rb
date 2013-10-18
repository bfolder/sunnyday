module SunnyDay
  class Client
    attr_accessor :app_id

    def initialize(app_id = nil)
      @app_id = app_id
    end

    def configure
      yield(self) if block_given?
    end
  end
end
