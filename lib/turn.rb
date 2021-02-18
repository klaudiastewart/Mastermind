require 'rainbow'
require 'colorize'

class Turn
  attr_reader :red_count, :white_count

  @@results_array = [] #this is a class variable, to call this on another class, Turn.results_array

  def initialize(secret_code, guess_input)
    @secret_code = secret_code
    @guess_input = guess_input
    @white_count = 0
    @red_count = 0
  end

  def check_positions_colors(guess_input)
    @red_count = (0...@secret_code.length).count do |index|
      @secret_code[index] == @guess_input[index]
    end
    colors = @secret_code.uniq
    @white_count = (0...@secret_code.length).count do |index1|
      (0...@secret_code.length).any? do |index2|
        @secret_code[index1] == @guess_input[index2] && index1 != index2 && @secret_code[index1] != @guess_input[index1]
      end
    end
  end

  def show_cheat_answer
    puts Rainbow("The secret code was #{@secret_code}. You are now leaving the game...\n\n\n\n\n\n\n\n").cyan.bold.blink
    exit
  end

  def show_guess_results(guess_input, turn_counter)
    puts "\e[2J\e[f"
    puts Rainbow("                     <><><><>   MASTERMIND   <><><><>").rebeccapurple.bold.blink
    puts " _______________________________________________________________________\n\n"
    @@results_array.each do |result|
      puts result
    end
    puts " _______________________________________________________________________\n\n"
    puts Rainbow("  TURN ##{turn_counter}: Guess '#{@guess_input}'' has #{@white_count} of the correct elements with #{@red_count} in the correct positions.").lightskyblue
    puts Rainbow("     => You've taken _ #{turn_counter} _ guess(es).\n\n").lightskyblue
    @@results_array << "   TURN ##{turn_counter}: Guess '#{@guess_input}' had correct -- *#{@white_count} Elements & *#{@red_count} Positions."
  end
end
