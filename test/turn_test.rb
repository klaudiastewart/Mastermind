require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new(nil)   #(player1=nil, player2=nil)
    @game = Game.new  #Keep this or not?
  end

  def test_turn_counter_works
    assert_equal 0, @turn.counter

    @game.get_guess

    assert_equal 1, @turn.counter
  end

  def test_pegs_array_empty_at_first_turn
    assert_equal [], @turn.pegs_array
  end

  # def test_guess_is_valid
  #   @game.get_guess
  #
  #   assert_equal String, @game.guess_input.class
  #   assert_equal 4, @game.guess_input.length
  # end

  # def test_guess_if_invalid
  #   @game.get_guess
  #
  #   refute_equal String, @game.guess_input.class
  #   refute_equal 4, @game.guess_input.length
  # end

  def test_if_pegs_can_be_added
    @game.get_guess

    assert_equal String, @game.guess_input.first.class
  end
end
