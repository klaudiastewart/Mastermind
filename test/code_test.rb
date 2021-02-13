require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'

class TimerTest < Minitest::Test
  def setup
    code= Code.now(4, red, green, yellow, blue)
  end

  def test_code_exists
    assert_instance_of Code, @code
  end

  def test_code_is_RBGY

    assert @code.start_time
  end

  def test_code_length
    assert_equal 4, @code.length
  end

end
