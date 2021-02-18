require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'
require './lib/timer'
require './lib/code'


class GameTest < Minitest::Test
  def setup
    @colors = ["Red", "Blue", "Green", "Yellow"]
    @code = Code.new(4, @colors)
    @turn = Turn.new(@code, "RRRB")
    @timer = Timer.new
    @game = Game.new(@code)
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_secret_code_attributes
    @game.pre_play

    assert_equal Code, @game.secret_code.class
    assert_equal 4, @game.secret_code.length
  end

  def test_game_turn_counter_starts_at_zero
    assert_equal 0, @game.turn_counter
  end

  def test_game_reads_total_time
    @timer = Timer.new
    refute_equal !0, @timer.total_time
  end

  def test_timer_starts
    assert Time.now, @timer.start_time
  end
end
