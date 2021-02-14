class Timer
  attr_reader :start_time,
              :end_time

  def initialize
    @start_time = Time.now
    @end_time = Time.now
  end

  # def total_time
  #   (@end_time - @start_time)
  # end
end
