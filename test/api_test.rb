require 'test/unit'

class TestCaseAPI < Test::Unit::TestCase
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
end