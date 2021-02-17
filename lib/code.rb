class Code
  attr_reader :length
  attr_accessor :secret_code

  def initialize(length, colors)
    @length = length
    @colors = colors
    @secret_code = []
  end

  def make_secret_code
    c1 = @colors[0][0].upcase
    c2 = @colors[1][0].upcase
    c3 = @colors[2][0].upcase
    c4 = @colors[3][0].upcase
    c5 = @colors[4][0].upcase if length > 4
    c6 = @colors[5][0].upcase if length == 8
    (@length).times do
      @secret_code << [c1, c2, c3, c4].sample if @length == 4
      @secret_code << [c1, c2, c3, c4, c5].sample if @length == 6
      @secret_code << [c1, c2, c3, c4, c5, c6].sample if @length == 8
    end
    @secret_code = @secret_code.join
  end

end
