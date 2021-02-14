class Game
  attr_reader :answer,
              :secret_code,
              :run_time,
              :pre_play_input

  def initialize (secret_code = nil)
    @secret_code = secret_code
    @run_time = 0
    @pre_play_input = pre_play_input
    @turn_counter = 0
    @timer = Timer.new #(start_time)
  end

  def end_game
    @timer2 = Timer.new
    @timer2.end_time
    run_time = (@timer2.end_time - @timer1.start_time).to_i
    time_in_min = run_time / 60
    time_in_sec = run_time - (time_in_min * 60)
    # require "pry"; binding.pry
    puts "Congratulations! You guessed the sequence #{@turn.guess_input} in #{@turn_counter} guess(es) over #{time_in_min} minutes, #{time_in_sec} seconds."
    puts "Please enter (p)lay again or (q)uit"
    # play_again?
    replay_input = gets.chomp
    if replay_input == "p"
      start_welcome
    elsif replay_input == "q"
      quit
    # else
    end
  end

  def instructions
    puts "INSTRUCTIONS:  How to Play Mastermind"
    puts " "
    puts "The computer makes a secret pattern of four color code pegs. Duplicates colors are allowed (no blank or empty peg holes)."
    puts " "
    puts "The player tries to guess the pattern, in both order and color. The player types the letters in the desired order to represent their guess, and presses enter. Once entered, the computer provides feedback by stating a summary of how many correct elements (correct color) and correct positions (correct color and position)."
    puts " "
    puts "If there are duplicate colors in the guess, they cannot all be determined to be a correct element. unless they correspond to the same number of duplicate colors in the hidden code. For example, if the hidden code is red-red-blue-blue and the player guesses red-red-red-blue, the feedback will state 0 correct elements and 3 correct positions [since the red-red-__-blue are all 3 correct colors in correct position], nothing for the third red as there is not a third red in the code."
    puts " "
    puts "Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the player guesses correctly, or concedes by calling to see the secret code [press (c)] or quits [press (q)].  Have fun!"
    puts " "
    puts "Press Enter to Continue"

    instructions_input = gets.chomp

    start_welcome if instructions_input = ""
  end

  def play
    turn = Turn.new(@code.secret_code)
    # require "pry"; binding.pry

    @turn_counter += 1
    @turn.get_guess
    end_game if @turn.guess_input == @code.secret_code
    # play if @turn.guess_input.class != String && @turn.guess_input.length == 4
    @turn.check_positions_colors
    @turn.show_guess_results
    play
  end

  def play_again?
    # replay_input = gets.chomp
    # if replay_input == "p"
    #   start_welcome
    # elsif replay_input == "q"
    #   quit
    # # else
    # end
    # start_welcome
  end

  def pre_play
    # turn = Turn.new   #(@code.secret_code)
    @timer1 = Timer.new #(start_time)
    @timer1.start_time
    @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    @code.make_secret_code
    @turn = Turn.new(@code.secret_code) #.join)
    require "pry"; binding.pry
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts ""
    @turn_counter += 1
    @turn.get_guess
    # puts "What's your guess?"
    # print "<<>>  "

    # @pre_play_input = gets.chomp

    # puts ""
    # quit if @pre_play_input == "q"
    # end_game if @pre_play_input == @code.secret_code
    # turn.valid_input?
    # turn.turn_look
    # turn.zero_correct
    @turn.check_positions_colors
    # require "pry"; bindexiting.pry
    end_game if @turn.guess_input == @code.secret_code
    @turn.show_guess_results
    play
  end

  def quit
    puts "You are now exiting the game.  Please press Enter to go to terminal."
    # quit_input = gets.chomp
    # puts "One last gaem, play again? Please enter (y)es and (n)o."
    # start_welcome if quit_input == "y"
    # abort
    # exit
    # puts "Bye"
  end

  def start_welcome
    puts "\e[2J\e[f"
    puts "   <><><><><><><>  Welcome to MASTERMIND  <><><><><><><><>"
    puts ""
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "<<>>  "

    user_input = gets.chomp

    puts ""
    puts ""
    puts ""
    if user_input == "q"
      quit
    elsif user_input == "i"
      instructions
    elsif user_input == "p"
      pre_play
    else
      puts "Invalid input."
      start_welcome
    end
  end
end
