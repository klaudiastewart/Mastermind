class Game
  attr_reader :answer,
              :code,
              :run_time,
              :turn_counter

  def initialize
    @turn_counter = 0
  end

  def end_game
    puts "Congratulations! You guessed the sequence #{@code.secret_code} in #{@turn_counter} guess(es) over " + @timer.total_time
    play_again?
  end

  def instructions
    puts <<-INSTRUCTIONS
    INSTRUCTIONS:  How to Play Mastermind

    The computer makes a secret pattern of four color code pegs. Duplicates colors are allowed (no blank or empty peg holes).

    The player tries to guess the pattern, in both order and color. The player types the letters in the desired order to represent their guess, and presses enter. Once entered, the computer provides feedback by stating a summary of how many correct elements (correct color) and correct positions (correct color and position).

    If there are duplicate colors in the guess, they cannot all be determined to be a correct element. unless they correspond to the same number of duplicate colors in the hidden code. For example, if the hidden code is red-red-blue-blue and the player guesses red-red-red-blue, the feedback will state 0 correct elements and 3 correct positions [since the red-red-__-blue are all 3 correct colors in correct position], nothing for the third red as there is not a third red in the code.

    Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the player guesses correctly, or concedes by calling to see the secret code [press (c)] or quits [press (q)].  Have fun!

    Press Enter to Continue
    INSTRUCTIONS

    instructions_input = gets.chomp

    start_welcome if instructions_input = ""
  end

  def play
    # require "pry"; binding.pry
    turn = Turn.new(@code.secret_code)
    @turn_counter += 1
    turn.get_guess
    end_game if turn.guess_input == @code.secret_code
    turn.check_positions_colors
    turn.show_guess_results
    play
  end

  def play_again?
    puts "Please enter (p)lay again or (q)uit"
    replay_input = gets.chomp
    if replay_input == "p"
      start_welcome
    elsif replay_input == "q"
      quit
    end
  end

  def pre_play
    @timer = Timer.new
    @timer.start_time
    @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    @code.make_secret_code
    # require "pry"; binding.pry
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
  end

  def quit
    puts "You are now exiting the game. See you again soon."
    exit
  end

  def start_welcome
    puts "\e[2J\e[f"
    puts "                  <><><><><><><>  Welcome to  <><><><><><><><>\n\n"
    puts "███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗ "
    puts "████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗"
    puts "██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║"
    puts "██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║"
    puts "██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝"
    puts "╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ \n\n\n\n"


    puts "          Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "<<>>  "
    puts ""

    user_input = gets.chomp

    puts "\n\n"
    if user_input == "q"
      quit
    elsif user_input == "i"
      instructions
    elsif user_input == "p"
      pre_play
      play
    else
      puts "Invalid input."
      start_welcome
    end
  end
end
