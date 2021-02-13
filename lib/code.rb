class Code
  attr_reader :length, :color1, :color2, :color3,
              :color4, :color5, :color6, :secret_code

  def initialize(length, color1, color2, color3, color4, color5=nil, color6=nil)
    @length = length
    @c1 = color1[0].upcase
    @c2 = color2[0].upcase
    @c3 = color3[0].upcase
    @c4 = color4[0].upcase
    @c5 = color4[0].upcase
    @c6 = color4[0].upcase
    @secret_code = []
  end

  def make_repeating_code
    (@length).times do
      @secret_code << [@c1, @c2, @c3, @c4].sample if @length == 4
      @secret_code << [@c1, @c2, @c3, @c4, @c5].sample if @length == 5
      @secret_code << [@c1, @c2, @c3, @c4, @c5, @c6].sample if @length == 6
    end
  end

  def make_non_repeating_code
    unigue = [@c1, @c2, @c3, @c4] if @length == 4
    unigue = [@c1, @c2, @c3, @c4, @c5] if @length == 5
    unigue = [@c1, @c2, @c3, @c4, @c5, @c6] if @length == 6
    (@length).times do
      @secret_code << unique.shuffle.shift
    end
  end
end
