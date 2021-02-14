require 'minitest/autorun'
require 'minitest/pride'
require './lib/timer'

class TimerTest < Minitest::Test
  def setup
    start_time = Time.now
    @timer = Timer.new
  end

  def test_timer_exists
    assert_instance_of Timer, @timer
  end

  def test_default_start_time
    assert @timer.start_time
  end

  def test_timer_finds_difference_in_completion_time
    refute_equal !0, @timer.total_time
  end
end
