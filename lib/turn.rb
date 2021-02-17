require 'rainbow'
require 'colorize'

class Turn
  attr_reader :pegs_array, :results_array

  def initialize(secret_code, guess_input)
    @secret_code = secret_code
    @guess_input = guess_input
    # @counter = 0
    @pegs_array = []
    @results_array = []
  end

  def check_positions_colors(guess_input)
    @pegs_array = []  #reset
    (0...@secret_code.length).each do |index|
      @pegs_array << "red" if @secret_code[index] == @guess_input[index]
    end
    # require "pry"; binding.pry
    #XX @secret_code.each_char do |char|
    #   (0..3).each do |index|
    #     if char == @guess_input[index]Copyright (c) 2018 Copyright Holder All Rights Reserved.
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
  end

  # def guess_options(guess_input)
    # if @guess_input == "Q"
    #   puts Rainbow("You are now leaving the game...\n\n\n\n\n\n\n\n").orange.bold.blink
    #   exit
    # end
    # show_cheat_answer if @guess_input == "C"
    # puts Rainbow("Invalid input, please enter the correct number of letter in the string.").papayawhip.bold if @guess_input.class != String || @guess_input.length != @secret_code.length
    # end
  # end

  def show_cheat_answer
    puts Rainbow("The secret code was #{@secret_code}. You are now leaving the game...\n\n\n\n\n\n\n\n").cyan.bold.blink
    exit
  end

  def show_guess_results(guess_input, turn_counter)
    puts "\e[2J\e[f"
    puts Rainbow("                     <><><><>   MASTERMIND   <><><><>").rebeccapurple.bold.blink
    puts " _______________________________________________________________________\n\n"
    @results_array.each do |result|
      puts result
    end
    puts " _______________________________________________________________________\n\n"
    puts Rainbow("  TURN ##{turn_counter}: Guess '#{@guess_input}'' has #{@white_count} of the correct elements with #{@pegs_array.count('red')} in the correct positions.").lightskyblue
    puts Rainbow("     => You've taken _ #{turn_counter} _ guess(es).\n\n").lightskyblue
    @results_array << "   TURN ##{turn_counter}: Guess '#{@guess_input}' had correct -- *#{@white_count} Elements & *#{@pegs_array.count('red')} Positions."
  end
end
