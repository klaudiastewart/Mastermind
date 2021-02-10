##CODE FRAMEWORK

class Game
  attr_reader :answer

  def initialize(argument)
    @argument = argument
    @answer = []
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
