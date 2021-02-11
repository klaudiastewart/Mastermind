
class Turn
  attr_reader :board, :turn_counter

  def initialize #(board = nil)
    # @board = board
    @turn_counter = 0
  end

  def check_solution
    game.end_game if guess_input == @answer
  end

  def valid_input?
    #check quess.length == 4 && correct letter
    if guess_input.length != 4
      p "Please insert a valid guess."
      get_guess
    else
      turn.check_positions_colors
    end
  end

  def zero_correct
    #first check, if no match, go direct to next guess
    if @answer.include?(guess_input[0]) == false && @answer.include?(guess_input[1]) == false && @answer.include?(guess_input[2]) == false && @answer.include?(guess_input[3]) == false
      p "You got zero correct, please guess again."
      @turn_counter += 1
      get_guess
    else
      break
    end
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
    p "Please enter a guess. If you want to quit, press 'q' or press 'c' for the solution."
    guess_input = gets.chomp
    quit if in_game_input == "q"
    show_cheat_answer if in_game_input == "c"
    @turn_counter += 1
    game.generate_solution
    check_solution
    valid_input?
    zero_correct
    # check_positions_colors
    # get_guess
  end

  def show_guess_results
    p "#{guess_input} has #{colors_correct} of the correct elements with #{positions_correct} in the correct positions
    You've taken #{@turn_counter} guess."
  end

  def show_cheat_answer
    p "The secret code is #{@answer}."
    quit
  end
end
