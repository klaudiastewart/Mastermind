##CODE FRAMEWORK

class Game
  attr_reader :answer

  def initialize(argument)
    @argument = argument
    @answer = []
  end

  def start
    p "Welcome to MASTERMIND"\n
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    p ">"

    user_input = gets.chomp

    if user_input == "q"
      game.quit
    elsif user_input == "i"
      game.instructions
    else user_input == "p"
      game.play
    end
  end

  def quit
    p "You are now exiting the game"
  end

  def instructions
    p "insert directions here"
  end

  def end_game
    p "Congratulations! You guessed the sequence #{answer} in #{turn_counter} over #{end_time}" #break time into seconds
    p "Do you want to (p)lay again or (q)uit?"
    game.play_again?
  end

  def play_again?
    replay_input = gets.chomp
    if replay_input == "p"
      game.start
    elsif replay_input == "q"
      game.quit
    else
      p "Please enter (p)lay again or (q)uit"
    end
    play_again
  end

  def play
    game.end_game if turn.check_solution == true
    
  end

  def generate_solution
    #randomly generate 4 color solution string
    #colors_positions = {'y' => 1,
                          'r' => 2,
                          'g' => 3,
                          'b' => 4
                        }
      colors_positions.each do |color,position|
        @answer.push(color, position).shuffle!
      end
  end

end
