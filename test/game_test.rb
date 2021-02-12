# Mastermind Tests
#
# startup screen comes up
# if 'quit' goes back to Terminal, maybe farewell msg, no results show
# if 'i' goes to instructions
# if 'p' goes to 'play' screen.
#
# from play, if 'q' goes to 'quit' method
# from play, get input for guess
#
# WRITTEN TEST:  assert end_time is 0:00 until guess is entered
# WRITTEN TEST:  assert guess-counter starts at 0 until guess is entered
# WRITTEN TEST:  assert code.length == 4
# WRITTEN TEST:  assert code.type == String
# WRITTEN TEST:  assert slots_array = []
# WRITTEN TEST:  assert pegs_array = []
# WRITTEN TEST:  assert_instance_of Game, game  ==> game class
#
# test if 'guess' is 4 letter
# if guess is improper length of letters or colors, WRITTEN TEST: assert equal 'Invalid' msg
# WRITTEN TEST:  assert equal guess_counter == 1
# WRITTEN TEST:  assert end_time > 0
# if color/placement is correct, peg is assigned
#
# if loops back to '#{guess}' has #{x} of the correct elements with #{y} in the correct positions.  You've taken X guess.  Enter your next guess'



#POSSIBLE CODE FRAMEWORK BELOW
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
#?? require './lib/player'
?? require './lib/turn'

class GameTest < Minitest::Test
  def setup
    @game = Game.new   #(player1=nil, player2=nil)
    @game.start_game
  end

  def test_game_exists
    # skip
    assert_instance_of Game, @game
  end

  def test_secret_code_attributes
    assert_equal String, @game.secret_code.class
    assert_equal 4, @game.secret_code.length
  end

  def test_game_time_starts
    # skip
    assert_equal 0, @game.run_time
  end
end
