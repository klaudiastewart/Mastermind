require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'
require './lib/timer'
require './lib/code'


class GameTest < Minitest::Test
  def setup
    @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    @turn = Turn.new
    @timer = Timer.new #(start_time)
    @game = Game.new(@code)
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
