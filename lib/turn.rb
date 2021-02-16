require 'rainbow'

class Turn
  attr_reader :guess_input, :counter, :pegs_array

  def initialize(secret_code)
    @secret_code = secret_code
    @counter = 0
    @pegs_array = []
    @results_array = [] #NEW
  end

  def check_positions_colors
    @pegs_array = []  #reset
    (0...@secret_code.length).each do |index|
      @pegs_array << "red" if @secret_code[index] == @guess_input[index]
    end
    # require "pry"; binding.pry
    #XX @secret_code.each_char do |char|
    #   (0..3).each do |index|
    #     if char == @guess_input[index]
    #       @pegs_array << "white"
    #       break
    #     end
    #   end
    # end
    #XX (1..3)each do |index|
    #   @secret_code[0] == @guess_input[1] || @secret_code[0] == @guess_input[2] || @secret_code[0] == @guess_input[3]
    # end
    #

    @white_count = (0...@secret_code.length).count do |index1|
      (0...@secret_code.length).any? do |index2|
        @secret_code[index1] == @guess_input[index2] && index1 != index2 && @secret_code[index1] != @guess_input[index1]
      end
    end

  def get_guess
    puts Rainbow("  Please enter a guess (4 letters). If you want to quit, press 'q' or press 'c' for the solution.").lightskyblue.bold
    print "  "
    @guess_input = gets.chomp.upcase
    @counter += 1
    puts "\n\n"
    if @guess_input == "Q"
      puts Rainbow("You are now leaving the game...\n\n\n\n\n\n\n\n").orange.bold.blink
      exit
    end
    show_cheat_answer if @guess_input == "C"
    puts Rainbow("Invalid input, please enter the correct number of letter in the string.").papayawhip.bold if @guess_input.class != String || @guess_input.length != @secret_code.length
  end

  def show_cheat_answer
    puts Rainbow("The secret code was #{@secret_code}. You are now leaving the game...\n\n\n\n\n\n\n\n").cyan.bold.blink
    exit
  end

  def show_guess_results
    puts "\e[2J\e[f"
    puts Rainbow("                     <><><><>   MASTERMIND   <><><><>").rebeccapurple.bold.blink
    puts " _______________________________________________________________________\n\n"
    @results_array.each do |result|
      puts result
    end
    puts " _______________________________________________________________________\n\n"
    puts Rainbow("  TURN ##{@counter}: Guess '#{@guess_input}'' has #{@white_count} of the correct elements with #{@pegs_array.count('red')} in the correct positions.").lightskyblue
    puts Rainbow("     => You've taken _ #{@counter} _ guess(es).\n\n").lightskyblue
    @results_array << "   TURN ##{@counter}: Guess '#{guess_input}' had correct -- *#{@white_count} Elements & *#{@pegs_array.count('red')} Positions."
  end
end
