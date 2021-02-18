require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_turn_exists
    turn = Turn.new(@secret_code, @guess_input)

    assert_instance_of Turn, turn
  end

  def test_red_count_empty_at_start
    turn = Turn.new(@secret_code, @guess_input)

    assert_equal 0, turn.red_count
  end

  def test_for_no_red_or_white_peg_in_four_letter_code
    secret_code = "RRRR"
    guess_input = "BBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.red_count
    assert_equal 0, turn.white_count
  end

  def test_for_one_red_peg_in_four_letter_code
    secret_code = "RRRR"
    guess_input = "RBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.red_count
  end

  def test_for_all_four_red_pegs_in_four_letter_code
    secret_code = "RRRR"
    guess_input = "RRRR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 4, turn.red_count
  end

  def test_for_no_white_peg_in_four_letter_code
    secret_code = "RRRR"
    guess_input = "BBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.white_count
  end

  def test_one_white_peg_in_four_letter_code
    secret_code = "YYYR"
    guess_input = "RBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.white_count
  end

  def test_four_white_pegs_in_four_letter_code
    secret_code = "RYBG"
    guess_input = "GBYR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 4, turn.white_count
  end

  def test_for_two_red_two_white_pegs_in_four_letter_code
    secret_code = "RYBR"
    guess_input = "RBYR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 2, turn.white_count
    assert_equal 2, turn.red_count
  end

  def test_for_one_red_three_white_pegs_in_four_letter_code
    secret_code = "RYBG"
    guess_input = "RBGY"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.red_count
    assert_equal 3, turn.white_count
  end

  def test_for_zero_red_three_white_pegs_in_four_letter_code
    secret_code = "GYBY"
    guess_input = "RGYB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.red_count
    assert_equal 3, turn.white_count 
  end

  def test_for_no_red_or_white_peg_in_six_letter_code
    secret_code = "RRRRRR"
    guess_input = "BBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.red_count
    assert_equal 0, turn.white_count
  end

  def test_for_one_red_peg_in_six_letter_code
    secret_code = "RRRRRR"
    guess_input = "RBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.red_count
  end

  def test_for_all_six_red_pegs_in_six_letter_code
    secret_code = "RRRRRR"
    guess_input = "RRRRRR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 6, turn.red_count
  end

  def test_for_no_white_peg_in_six_letter_code
    secret_code = "RRRRRR"
    guess_input = "BBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.white_count
  end

  def test_one_white_peg_in_six_letter_code
    secret_code = "YYYRGG"
    guess_input = "RBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.white_count
  end

  def test_six_white_pegs_in_six_letter_code
    secret_code = "RYBGOO"
    guess_input = "OOGBYR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 6, turn.white_count
  end

  def test_for_three_red_three_white_pegs_in_six_letter_code
    secret_code = "RYBGOB"
    guess_input = "RYBBGO"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 3, turn.white_count
    assert_equal 3, turn.red_count
  end

  def test_for_two_red_four_white_pegs_in_six_letter_code
    secret_code = "RYBGOR"
    guess_input = "RYROGB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 2, turn.red_count
    assert_equal 4, turn.white_count
  end

  def test_for_no_red_or_white_peg_in_eight_letter_code
    secret_code = "RRRRRRRR"
    guess_input = "BBBBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.red_count
    assert_equal 0, turn.white_count
  end

  def test_for_one_red_peg_in_eight_letter_code
    secret_code = "RRRRRRRR"
    guess_input = "RBBBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.red_count
  end

  def test_for_all_six_red_pegs_in_eight_letter_code
    secret_code = "RRRRRRRR"
    guess_input = "RRRRRRRR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 8, turn.red_count
  end

  def test_for_no_white_peg_in_eight_letter_code
    secret_code = "RRRRRRRR"
    guess_input = "BBBBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 0, turn.white_count
  end

  def test_one_white_peg_in_eight_letter_code
    secret_code = "YYYRGGGG"
    guess_input = "RBBBBBBB"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 1, turn.white_count
  end

  def test_six_white_pegs_in_eight_letter_code
    secret_code = "RYBGOOVV"
    guess_input = "OOGBYRVV"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 6, turn.white_count
  end

  def test_for_four_red_four_white_pegs_in_eight_letter_code
    secret_code = "RYBGOBVR"
    guess_input = "RYBGBORV"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 4, turn.white_count
    assert_equal 4, turn.red_count
  end

  def test_for_three_red_five_white_pegs_in_eight_letter_code
    secret_code = "VOYRGBRB"
    guess_input = "VYBRGOBR"
    turn = Turn.new(secret_code, guess_input)

    turn.check_positions_colors

    assert_equal 3, turn.red_count
    assert_equal 5, turn.white_count
  end
end
