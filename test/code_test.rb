require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'

class TimerTest < Minitest::Test
  def setup
    @code = Code.new(4, "red", "green", "yellow", "blue")
    @code.make_repeating_code
    @RBGY = ["R", "B", "G", "Y"]
  end

  def test_code_exists
    assert_instance_of Code, @code
  end

  def test_code_is_either_RBGY
    assert_equal true, ["R", "B", "G", "Y"].include?(@code.secret_code[0])
    assert_equal true, @RBGY.include?(@code.secret_code[1])
    assert_equal true, @RBGY.include?(@code.secret_code[2])
    assert_equal true, @RBGY.include?(@code.secret_code[3])
  end

  def test_code_length
    assert_equal 4, @code.length
  end

end
