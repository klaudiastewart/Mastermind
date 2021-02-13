require 'minitest/autorun'
require 'minitest/pride'
require './lib/timer'

class TimerTest < Minitest::Test
  def setup
    start_time = Time.now
    @timer = Timer.new(start_time)
  end

  def test_default_start_time
    assert @timer.start_time
  end

  def test_default_end_time
    assert @timer.end_time
  end

  def test_total_time_of_game
    # skip
    @timer.end_time
    assert_equal (), @timer.total_time
  end
end
