
class Turn
  attr_reader :board, :turn_counter, :pegs_array, :guess_input

  def initialize  #(secret_code)
    # @secret_code = secret_code
    @turn_counter = 0
    @pegs_array = []
  end

  def check_positions_colors
    @pegs_array = []  #reset
    if @secret_code[0] == @guess_input[0]
      @pegs_array << "red"
      @pegs_array << "white"
    end
    if @secret_code[1] == @guess_input[1]
      @pegs_array << "red"
      @pegs_array << "white"
    end
    if @secret_code[2] == @guess_input[2]
      @pegs_array << "red"
      @pegs_array << "white"
    end
    if @secret_code[3] == @guess_input[3]
      @pegs_array << "red"
      @pegs_array << "white"
    end
    if @secret_code[0] == @guess_input[1] || @secret_code[0] == @guess_input[2] || @secret_code[0] == @guess_input[3]
      @pegs_array << "white"
    end
    if @secret_code[1] == @guess_input[0] || @secret_code[1] == @guess_input[2] || @secret_code[1] == @guess_input[3]
      @pegs_array << "white"
    end
    if @secret_code[2] == @guess_input[0] || @secret_code[2] == @guess_input[1] || @secret_code[2] == @guess_input[3]
      @pegs_array << "white"
    end
    if @secret_code[3] == @guess_input[0] || @secret_code[3] == @guess_input[1] || @secret_code[3] == @guess_input[2]
      @pegs_array << "white"
    end
  end

  # def check_solution    ##MOVED TO GAME.rb
  #   @guess_input == @secret_code
  # end

  def get_guess
    puts "Please enter a guess. If you want to quit, press 'q' or press 'c' for the solution."
    @guess_input = gets.chomp
    @turn_counter += 1
    quit if @guess_input == "q"
    show_cheat_answer if @guess_input == "c"
    # game.generate_solution    ##MOVED TO GAME.rb
    # check_solution
    # valid_input?
    # zero_correct
    # check_positions_colors
  end

  def show_cheat_answer
    puts "The secret code is #{@secret_code}."
    # quit  ##NO call reverses
  end

  def show_guess_results
    # require "pry"; binding.pry
    #clear screen
    puts "#{@guess_input} has #{@pegs_array.count('white').to_s} of the correct elements with #{@pegs_array.count('red').to_s} in the correct positions."
    puts "You've taken #{@turn_counter} guess."
  end

  def valid_input?
    #check quess.length == 4 && correct letter
    if @guess_input.length != 4
      puts "Please insert a valid guess."
      get_guess
    else
      check_positions_colors
    end
  end

  def zero_correct
    #first check, if no match, go direct to next guess
    if @secret_code.include?(@guess_input[0]) == false && @secret_code.include?(@guess_input[1]) == false && @secret_code.include?(@guess_input[2]) == false && @secret_code.include?(@guess_input[3]) == false
      puts "You got zero correct, please guess again."
      @turn_counter += 1
      get_guess
    #   break
    end
  end
end
