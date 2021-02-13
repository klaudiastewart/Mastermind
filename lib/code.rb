class Code

  def initialize(length, color1, color2, color3, color4, color5=nil, color6=nil)
    @length = length
    @c1 = color1[0].upcase
    @c2 = color2[0].upcase
    @c3 = color3[0].upcase
    @c4 = color4[0].upcase
    @secret_code = []
  end

  def make_repeating_code(@c1, @c2, @c3, @c4)
    (@length).times do
      @secret_code << [@c1, @c2, @c3, @c4].sample
    end
  end

  def make_non_repeating_code(@c1, @c2, @c3, @c4)
    unigue = [@c1, @c2, @c3, @c4]
    (@length).times do
      @secret_code << unique.shuffle.shift
    end
  end
end
