require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'
# require "pry"; binding.pry

class TimerTest < Minitest::Test
  def test_code_exists
    code = Code.new(4, "red", "blue", "green", "yellow")

    assert_instance_of Code, code
  end

  def test_4_length_repeating_code
    code = Code.new(4, "red", "blue", "green", "yellow")
    code.make_repeating_code
    @RBGY = ["R", "B", "G", "Y"]

    assert_equal true, @RBGY.include?(code.secret_code[0])
    assert_equal true, @RBGY.include?(code.secret_code[1])
    assert_equal true, @RBGY.include?(code.secret_code[2])
    assert_equal true, @RBGY.include?(code.secret_code[3])

    assert_equal 4, code.length
  end

  def test_5_length_non_repeating_code
    code = Code.new(5, "red", "blue", "green", "yellow", "orange")
    code.make_non_repeating_code
    @RBGYO = ["R", "B", "G", "Y", "O"]

    assert_equal 5, code.length
    assert_equal true, @RBGYO.include?(code.secret_code[0])

    assert_equal true, (code.secret_code[0] != code.secret_code[1]) && (code.secret_code[0] != code.secret_code[2]) && (code.secret_code[0] != code.secret_code[3]) && (code.secret_code[0] != code.secret_code[4])

    assert_equal true, (code.secret_code[1] != code.secret_code[2]) && (code.secret_code[1] != code.secret_code[3]) && (code.secret_code[1] != code.secret_code[4])

    assert_equal true, (code.secret_code[2] != code.secret_code[3]) && (code.secret_code[2] != code.secret_code[4])

    assert_equal true, (code.secret_code[3] != code.secret_code[4])
  end

  def test_6_length_repeating_code
    code = Code.new(6, "red", "green", "yellow", "blue", "orange", "violet")
    code.make_non_repeating_code
    @RBGYOV = ["R", "B", "G", "Y", "O", "V"]

    assert_equal true, @RBGYOV.include?(code.secret_code[0])
    assert_equal true, @RBGYOV.include?(code.secret_code[1])
    assert_equal true, @RBGYOV.include?(code.secret_code[2])
    assert_equal true, @RBGYOV.include?(code.secret_code[3])
    assert_equal true, @RBGYOV.include?(code.secret_code[4])
    assert_equal true, @RBGYOV.include?(code.secret_code[5])

    assert_equal 6, code.length
  end
end
