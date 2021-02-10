
class Turn
  attr_reader :board, :turn_counter

  def initialize(board)
    @board = board
    @turn_counter = 0
  end

  def check_solution
    #if guess == answer then game.end_game
  end

  def valid_input?
    #check quess.length == 4 && correct letter
  end

  def zero_correct
    #first check, if no match, go direct to next guess
    p "You got zero correct, please guess again."
  end

  def check_positions_colors
    #check colors at each position/index
    assign_pegs
    show_guess_results
  end

  def assign_pegs
    #pull info from check_positions,
  end

  def get_guess
    p "Please enter a guess"
    guess_input = gets.chomp
    @turn_counter += 1
    valid_input?
    check_solution
    zero_correct
    check_positions_colors
    get_guess
  end

  def show_guess_results
    p "#{guess_input} has #{colors_correct} of the correct elements with #{positions_correct} in the correct positions
    You've taken #{@turn_counter} guess."

  end

end
