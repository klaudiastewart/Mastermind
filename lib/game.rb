##CODE FRAMEWORK

class Game
  attr_reader :answer

  def initialize  #(argument)
    # @argument = argument
    @answer = []
  end

  def end_game
    p "Congratulations! You guessed the sequence #{answer} in #{turn_counter} over #{end_time}" #break time into seconds
    p "Do you want to (p)lay again or (q)uit?"
    game.play_again?
  end

  def generate_solution
    #randomly generate 4 color solution string
    colors_positions = {  'y' => 1,
                          'r' => 2,
                          'g' => 3,
                          'b' => 4
                        }
      colors_positions.each do |color,position|
        @answer.push(color, position).shuffle!
      end
  end

  def instructions
    p "insert directions here"
  end

  def play
    show_cheat_answer if turn.cheat == true
    end_game if turn.check_solution == true
    turn.get_guess
    turn.get_guess if turn.zero_correct == true
    turn.check_position_color
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
