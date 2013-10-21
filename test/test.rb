$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/../lib' )

require 'test/unit'
require 'sunnyday'

class TestCaseGeneral < Test::Unit::TestCase
  def test_client_configuration
    @client = SunnyDay.client
    assert_not_nil(@client, 'Client should not be nil')

    @client.configure do |config|
      config.app_id = 21311323
    end
    assert_equal(21311323, @client.config.app_id, 'App Id should equal 21311323')

    @client = SunnyDay::Client.new(app_id: 21311323, language: 'de', api_version: '1.5', units: 'imperial')
    assert_not_nil(@client, 'Client should not be nil')
    assert_equal(21311323, @client.config.app_id, 'App Id should equal 21311323')
    assert_equal('de', @client.config.language, 'Language should be de')
    assert_equal('1.5', @client.config.api_version, 'Api version should be 1.5')
    assert_equal('imperial', @client.config.units, 'Units should be imperial')
  end

  def setup
    @client = SunnyDay.client
  end

  def test_current_weather
    results = @client.current_weather(q: 'London, UK')
    assert_equal('London', results[:name], 'Should be London')
  end

  def test_forecast
    results = @client.forecast(q: 'London,UK')
    assert_equal('London', results[:city][:name], 'Should be London')
  end

  def test_daily_forecast
    results = @client.daily_forecast(q: 'London,UK', cnt: 7)
    assert_equal('London', results[:city][:name], 'Should be London')
    assert_equal(7, results[:list].size, 'This should be 7 days forecast')
  end

  def test_find
    results = @client.find(q: 'London,UK')
    assert(results[:list].size > 0, 'There should be at least one result')
    assert_equal('London', results[:list][0][:name], 'Should be London')
  end
end