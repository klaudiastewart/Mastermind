class Code
  attr_reader :length
  attr_accessor :secret_code

  # def initialize(length, color1, color2, color3, color4, color5=nil, color6=nil)
  def initialize(length, hues)
    @length = length
    @c1 = hues[0][0].upcase
    @c2 = hues[1][0].upcase
    @c3 = hues[2][0].upcase
    @c4 = hues[3][0].upcase
    @c5 = hues[4][0].upcase   if hues.count == 5
    @c6 = hues[5][0].upcase   if hues.count == 6
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
