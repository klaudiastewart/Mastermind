class Game
  attr_reader :answer,
              :secret_code,
              :run_time

  def initialize (secret_code = nil)
    @secret_code = secret_code
    @run_time = 0
  end

  def end_game
    @timer.end_timer
    puts "Congratulations! You guessed the sequence #{answer} in #{turn_counter} over #{@timer.total_time}" #break time into seconds
    puts "Do you want to (p)lay again or (q)uit?"
    play_again?
  end

  def generate_solution
    #randomly generate 4 color solution string
    colors = ['y', 'r', 'g', 'b']
    4.times do
      @answer << colors.sample
    end
    @answer
  end

  # def generate_solution
  #   colors_positions = {  'y' => 1,
  #                         'r' => 2,
  #                         'g' => 3,
  #                         'b' => 4
  #                       }
  #     colors_positions.each do |color,position|
  #       @answer.push(color, position).shuffle!
  #     end
  # end

  def instructions
    puts "insert directions here"
  end

  # def go_guess
  #   turn = Turn.new
  #   turn.get_guess
  # end

  def play
    turn = Turn.new   #(code.secret_code)
    timer = Timer.new #(start_time)
    timer.start_time
    turn.get_guess
    #OR turn.end_game if turn.check_solution
    end_game if turn.guess_input == code.secret_code
    turn.valid_input?
    turn.zero_correct
    turn.check_positions_colors
    turn.show_guess_results
    play
  end

  def play_again?
    replay_input = gets.chomp
    if replay_input == "p"
      start
    elsif replay_input == "q"
      quit
    else
      puts "Please enter (p)lay again or (q)uit"
    end
    start_welcome
  end

  def pre_play
    code = Code.new(4, "Red", "Blue", "Green", "Yellow")
    code.make_secret_code
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"
    print "<<>>  "

    guess_input = gets.chomp

    quit if guess_input == "q"
    end_game if guess_input == code.secret_code
    turn.valid_input?
    turn.zero_correct
    turn.check_positions_colors
    turn.show_guess_results
    play
  end

  def quit
    puts "You are now exiting the game"
    puts "One last gaem, play again? Please enter (y)es and (n)o."
    quit_input = gets.chomp
    start if quit_input == "y"
  end

  # def welcome
  #
  # end

  def start_welcome
    puts "\e[2J\e[f"
    puts "   <><><><><><><>  Welcome to MASTERMIND  <><><><><><><><>"
    puts ""
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "<<>>  "

    user_input = gets.chomp

    if user_input == "q"
      quit
    elsif user_input == "i"
      instructions
    elsif user_input == "p"
      pre_play
    else
      puts "Invalid input."
      start
    end
  end
end
