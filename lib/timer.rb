class Timer
  attr_reader :start_time,
              :end_time

  def initialize  #(start_time)  #? end_time)
    @start_time = Time.now
    @end_time = Time.now
    # require "pry"; binding.pry
  end

  # def begin_game
  #
  # end

  def total_time
    # require "pry"; binding.pry
    (@end_time - @start_time)
  end
end
