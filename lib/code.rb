class Code
  attr_reader :length
  attr_accessor :secret_code

  def initialize(length, colors_used)
    @length = length
    @c1 = colors_used[0][0].upcase
    @c2 = colors_used[1][0].upcase
    @c3 = colors_used[2][0].upcase
    @c4 = colors_used[3][0].upcase
    @c5 = colors_used[4][0].upcase if length == 6
    @c6 = colors_used[5][0].upcase if length == 8
    @secret_code = []
  end

  def make_secret_code
    (@length).times do
      @secret_code << [@c1, @c2, @c3, @c4].sample if @length == 4
      @secret_code << [@c1, @c2, @c3, @c4, @c5].sample if @length == 6
      @secret_code << [@c1, @c2, @c3, @c4, @c5, @c6].sample if @length == 8
    end
    @secret_code = @secret_code.join
  end

end
