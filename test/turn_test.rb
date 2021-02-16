require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new(secret_code = nil)
    @game = Game.new
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_is_zero_at_start
    assert_equal 0, @turn.counter
  end

  def test_turn_can_add
    @game.get_guess
    assert_equal 1, @turn.get_counter
  end

  def test_pegs_array_empty_at_start
    assert_equal [], @turn.pegs_array
  end

  # def test_if_pegs_can_be_added
  #   @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
  #   @code.make_secret_code
  #   @turn.guess_input = "RRRR"
  #
  #   @turn.check_positions_colors
  #   require "pry"; binding.pry
  #   refute_equal 0, @turn.pegs_array.length
  # end
end
