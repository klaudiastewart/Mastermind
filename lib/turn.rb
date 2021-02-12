
class Turn
  attr_reader :board, :turn_counter, :pegs_array, :guess_input

  def initialize(secret_code)
    @secret_code = secret_code
    @turn_counter = 0
    @pegs_array = []
    @element_pegs = []  #reset
    @position_pegs = []  #reset
  end

  def assign_pegs
    @pegs_array.shuffle
    #pull info from check_positions,
  end

  def check_positions_colors
    @position_pegs = []  #reset
    @element_pegs = []  #reset
    if @secret_code[0] == @guess_input[0]
      @position_pegs << "red peg"
      @element_pegs << "white peg"
    end
    if @secret_code[1] == @guess_input[1]
      @position_pegs << "red peg"
      @element_pegs << "white peg"
    end
    if @secret_code[2] == @guess_input[2]
      @position_pegs << "red peg"
      @element_pegs << "white peg"
    end
    if @secret_code[3] == @guess_input[3]
      @position_pegs << "red peg"
      @element_pegs << "white peg"
    end
    if @secret_code[0] == @guess_input[1] || @secret_code[0] == @guess_input[2] || @secret_code[0] == @guess_input[3]
      @element_pegs << "white peg"
    end
    if @secret_code[1] == @guess_input[0] || @secret_code[1] == @guess_input[2] || @secret_code[1] == @guess_input[3]
      @element_pegs << "white peg"
    end
    if @secret_code[2] == @guess_input[0] || @secret_code[2] == @guess_input[1] || @secret_code[2] == @guess_input[3]
      @element_pegs << "white peg"
    end
    if @secret_code[3] == @guess_input[0] || @secret_code[3] == @guess_input[1] || @secret_code[3] == @guess_input[2]
      @element_pegs << "white peg"
    end
  end

  def check_solution
    @guess_input == @secret_code
  end

  def get_guess
    p "Please enter a guess. If you want to quit, press 'q' or press 'c' for the solution."
    @guess_input = gets.chomp
    quit if @guess_input == "q"
    show_cheat_answer if @guess_input == "c"
    @turn_counter += 1
    # game.generate_solution
    # check_solution
    # valid_input?
    # zero_correct
    # check_positions_colors
  end

  def show_cheat_answer
    p "The secret code is #{@secret_code}."
    quit
  end

  def show_guess_results
    require "pry"; binding.pry
    p "#{@guess_input} has #{@elements_pegs.length.to_s} of the correct elements with #{@positions_pegs.length.to_s} in the correct positions
    You've taken #{@turn_counter} guess."
    # game.play
  end

  def valid_input?
    #check quess.length == 4 && correct letter
    if @guess_input.length != 4
      p "Please insert a valid guess."
      get_guess
    else
      check_positions_colors
    end
  end

  def zero_correct
    #first check, if no match, go direct to next guess
    if @secret_code.include?(@guess_input[0]) == false && @secret_code.include?(@guess_input[1]) == false && @secret_code.include?(@guess_input[2]) == false && @secret_code.include?(@guess_input[3]) == false
      p "You got zero correct, please guess again."
      @turn_counter += 1
      get_guess
    # else
    #   break
    end
  end
end
