require 'minitest/autorun'
require 'minitest/pride'
require './lib/timer'

class TimerTest < Minitest::Test
  def setup
    start_time = Time.now
    @timer = Timer.new #(start_time)
  end

  def test_timer_exists
    assert_instance_of Timer, @timer
  end

  def test_default_start_time
    assert @timer.start_time
  end

  def test_default_end_time
    assert @timer.end_time
  end

  def test_change_in_time
    # skip
    stop_timer= Timer.new
    @timer.start_time
    stop_timer.end_time
    refute_equal !0, (@timer.start_time - stop_timer.end_time)
  end
end
