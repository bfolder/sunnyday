require 'test/unit'

class TestCaseGeneral < Test::Unit::TestCase
  def test_client_configuration
    @client = SunnyDay.client
    assert_not_nil(@client, 'Client should not be nil')

    @client.configure do |config|
      config.app_id = 21311323
    end

    assert_equal(@client.config.app_id, 21311323, 'App Id should equal 21311323')

    @client = SunnyDay.client(app_id: 21311323)

    assert_not_nil(@client, 'Client should not be nil')
    assert_equal(@client.config.app_id, 21311323, 'App Id should equal 21311323')
  end
end