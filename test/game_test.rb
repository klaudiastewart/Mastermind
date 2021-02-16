require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'
require './lib/timer'
require './lib/code'


class GameTest < Minitest::Test
  def setup
    @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    @turn = Turn.new(@code)
    @timer = Timer.new
    @game = Game.new #(@code)
    # @game.start_welcome
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_secret_code_attributes
    @game.pre_play

    assert_equal String, @game.code.secret_code.class
    assert_equal 4, @game.code.secret_code.length
  end

  def test_game_turn_counter_starts_at_zero
    # skip
    assert_equal 0, @game.turn_counter
  end

  def test_game_reads_total_time
    @timer = Timer.new
    refute_equal !0, @timer.total_time
  end
end
