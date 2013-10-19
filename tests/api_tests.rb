require 'test/unit'

class TestCaseAPI < Test::Unit::TestCase
  def setup
    @client = SunnyDay.client
  end

  def test_current_weather
    results = @client.current_weather(:q => 'London, UK')
    assert_equal('London', results[:name], 'Should be London')
  end

  def test_forecast
    results = @client.forecast(:q => 'London,UK')
    assert_equal('London', results[:city][:name], 'Should be London')
  end
end