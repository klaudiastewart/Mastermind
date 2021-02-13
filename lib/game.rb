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
    # @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
  end

  def end_game
    @timer.end_time
    puts "Congratulations! You guessed the sequence #{@turn.guess_input} in #{@turn_counter} guess(es) over #{@timer.total_time}" #break time into seconds
    puts "Do you want to (p)lay again or (q)uit?"
    play_again?
  end

  def instructions
    puts "insert directions here"
  end

  # def go_guess
  #   turn = Turn.new
  #   turn.get_guess
  # end

  def play
    turn = Turn.new(@code.secret_code.join)
    require "pry"; binding.pry

    # timer = Timer.new #(start_time)
    # timer.start_time
    @turn_counter += 1
    @turn.get_guess
    end_game if @turn.guess_input == @code.secret_code.join
    # @turn.valid_input?
    # @turn.zero_correct
    @turn.check_positions_colors
    @turn.show_guess_results
    play
  end

  def play_again?
    replay_input = gets.chomp
    if replay_input == "p"
      start_welcome
    elsif replay_input == "q"
      quit
    else
      puts "Please enter (p)lay again or (q)uit"
    end
    # start_welcome
  end

  def pre_play
    # turn = Turn.new   #(@code.secret_code)
    @timer = Timer.new #(start_time)
    @timer.start_time
    @code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    @code.make_secret_code
    @turn = Turn.new(@code.secret_code.join)
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
    end_game if @turn.guess_input == @code.secret_code.join
    @turn.show_guess_results
    play
  end

  def quit
    puts "You are now exiting the game"
    puts "One last gaem, play again? Please enter (y)es and (n)o."
    quit_input = gets.chomp
    start if quit_input == "y"
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
