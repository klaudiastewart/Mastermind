require 'rainbow'

class Turn
  attr_reader :red_count, :white_count
  @@results_array = []

  def initialize(secret_code, guess_input)
    @secret_code = secret_code
    @guess_input = guess_input
    @white_count = 0
    @red_count = 0
  end

  def check_positions_colors
    @red_count = (0...@secret_code.length).count do |index|
      @secret_code[index] == @guess_input[index]
    end
    code_colors = Hash.new(0)
    guess_colors = Hash.new(0)
    @secret_code.each_char do |color|
      code_colors[color] += 1
    end
    @guess_input.each_char do |color|
      guess_colors[color] += 1
    end
    code_colors.keys.each do |color|
      @white_count += [code_colors[color], guess_colors[color]].min
    end
    @white_count -= @red_count
  end

  def show_cheat_answer
    puts Rainbow("The secret code was #{@secret_code}. You are now leaving the game...\n\n\n\n\n\n\n\n").cyan.bold.blink
    exit
  end

  def show_guess_results(turn_counter)
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
