class Timer
  attr_reader :start_time
  
  def initialize
    @start_time = Time.now
  end

  def total_time
    run_time = (Time.now - @start_time).to_i
    time_in_min = run_time / 60
    time_in_sec = run_time - (time_in_min * 60)
    "#{time_in_min} minute(s), #{time_in_sec} seconds."
  end
end
