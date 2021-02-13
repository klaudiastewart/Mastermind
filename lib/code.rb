class Code
  attr_reader :length, :color1, :color2, :color3,
              :color4, :color5, :color6, :secret_code

  def initialize(length, color1, color2, color3, color4, color5=nil, color6=nil)
    @length = length
    @c1 = color1[0].upcase
    @c2 = color2[0].upcase
    @c3 = color3[0].upcase
    @c4 = color4[0].upcase
    @c5 = color5[0].upcase if color5.class == String
    @c6 = color6[0].upcase if color6.class == String
    @secret_code = []
  end

  def make_secret_code
    (@length).times do
      @secret_code << [@c1, @c2, @c3, @c4].sample if @length == 4
      @secret_code << [@c1, @c2, @c3, @c4, @c5].sample if @length == 6
      @secret_code << [@c1, @c2, @c3, @c4, @c5, @c6].sample if @length == 8
    end
    # @secret_code = @secret_code.join

  end

end
