require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'

class TimerTest < Minitest::Test
  def test_code_exists
    code = Code.new(4, "red", "blue", "green", "yellow")

    assert_instance_of Code, code
  end

  def test_it_makes_4_length_4_colors_code
    code = Code.new(4, "red", "blue", "green", "yellow")
    code.make_secret_code
    @RBGY = ["R", "B", "G", "Y"]

    assert_equal true, @RBGY.include?(code.secret_code[0])
    assert_equal true, @RBGY.include?(code.secret_code[1])
    assert_equal true, @RBGY.include?(code.secret_code[2])
    assert_equal true, @RBGY.include?(code.secret_code[3])

    assert_equal 4, code.length
  end

  def test_it_makes_6_length_5_colors_code
    code = Code.new(6, "red", "blue", "green", "yellow", "orange")
    code.make_secret_code
    @RBGYO = ["R", "B", "G", "Y", "O"]

    assert_equal true, @RBGYO.include?(code.secret_code[0])
    assert_equal true, @RBGYO.include?(code.secret_code[1])
    assert_equal true, @RBGYO.include?(code.secret_code[2])
    assert_equal true, @RBGYO.include?(code.secret_code[3])
    assert_equal true, @RBGYO.include?(code.secret_code[4])
    assert_equal true, @RBGYO.include?(code.secret_code[5])

    assert_equal 6, code.length
  end

  def test_it_makes_8_length_6_colors_code
    code = Code.new(8, "red", "green", "yellow", "blue", "orange", "violet")
    code.make_secret_code
    @RBGYOV = ["R", "B", "G", "Y", "O", "V"]

    assert_equal true, @RBGYOV.include?(code.secret_code[0])
    assert_equal true, @RBGYOV.include?(code.secret_code[1])
    assert_equal true, @RBGYOV.include?(code.secret_code[2])
    assert_equal true, @RBGYOV.include?(code.secret_code[3])
    assert_equal true, @RBGYOV.include?(code.secret_code[4])
    assert_equal true, @RBGYOV.include?(code.secret_code[5])
    assert_equal true, @RBGYOV.include?(code.secret_code[6])
    assert_equal true, @RBGYOV.include?(code.secret_code[7])

    assert_equal 8, code.length
  end
end
