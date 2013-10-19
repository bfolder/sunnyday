require 'test/unit'

class TestCaseGeneral < Test::Unit::TestCase
  def test_client_configuration
    @client = SunnyDay.client
    assert_not_nil(@client, 'Client should not be nil')

    @client.configure do |config|
      config.app_id = 21311323
    end

    assert_equal(21311323, @client.config.app_id, 'App Id should equal 21311323')

    @client = SunnyDay.client(app_id: 21311323, language: 'de', api_version: '1.5', units: 'imperial')

    assert_not_nil(@client, 'Client should not be nil')
    assert_equal(21311323, @client.config.app_id, 'App Id should equal 21311323')
    assert_equal('de', @client.config.language, 'Language should be de')
    assert_equal('1.5', @client.config.api_version, 'Api version should be 1.5')
    assert_equal('imperial', @client.config.units, 'Units should be imperial')
  end
end