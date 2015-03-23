require 'pry'
class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  # def to_decimal
  #   decimal = 0
  #   a = @trinary.chars.reverse
  #   a.each_with_index {|n, i| decimal = decimal + n.to_i * (3 ** i)}
  #   decimal
  # end


  def to_decimal
    return 0 if @trinary =~ /[^012]/
    @trinary.chars.reduce(0) do |sum, current|
      (sum * 3) + current.to_i
    end
  end

end