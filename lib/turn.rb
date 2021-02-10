
class Turn
  attr_reader :board, :turn_counter

  def initialize(board)
    @board = board
    @turn_counter = 0
  end

  def check_solution
    #if guess == solution then 'win' screen
    #turn_counter += 1
  end

  def valid_input?
    #check quess.length == 4 && correct letter
  end

  def zero_correct
    #first check, if no match, go direct to next guess
    #turn_counter += 1
  end

  def check_positions
    #check colors at each position/index
  end

  def assign_pegs
    #pull info from check_positions,
  end

end
