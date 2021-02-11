class Game
  attr_reader :answer,
              :game_start

  def initialize (game_start) #(argument)
    # @argument = argument
    @answer = []
    @game_start = game_start
  end

  def end_game
    #STOP run_time
    p "Congratulations! You guessed the sequence #{answer} in #{turn_counter} over #{end_time}" #break time into seconds
    #RESET run_time
    p "Do you want to (p)lay again or (q)uit?"
    game.play_again?
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
    p "insert directions here"
  end

  def play
    #START run_time
    turn.get_guess
  end

  def play_again?
    replay_input = gets.chomp
    if replay_input == "p"
      start
    elsif replay_input == "q"
      quit
    else
      p "Please enter (p)lay again or (q)uit"
    end
    play_again
  end

  def quit
    p "You are now exiting the game"
    p "Do you want to play again? Please enter 'y' for yes and 'n' for no."
    quit_input = gets.chomp
    start if quit_input == "y"
  end

  def start
    p "Welcome to MASTERMIND\n"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    p ">"

    user_input = gets.chomp

    if user_input == "q"
      quit
    elsif user_input == "i"
      instructions
    elsif user_input == "p"
      play
    else
      p "Invalid input."
      start
    end
  end
end
