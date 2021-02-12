require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new   #(player1=nil, player2=nil)
    @game = Game.new #Keep this or not?
  end

  def test_turn_counter_works
    assert_equal 0, @turn.turn_counter

    @game.get_guess

    assert_equal 1, @turn.turn_counter
  end

  def test_pegs_array_empty_at_first_turn
    assert_equal [], @turn.pegs_array
  end

  def test_ 
  end
